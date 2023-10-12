import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myfoodtracker/_utils/food_service.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:intl/intl.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

void test() async {
  User user = User.getActualUser();

  print(await user.getShoppingList());
  print(await user.getStorageBarcodeList());

  /*Product? p = await FoodService.getProduct('42046202');
  Product? p2 = await FoodService.getProduct('8013355998832');


  await user.addProductToShoppingList(p!);
  await user.addProductToStorageList(p!, 1, DateTime.now().add(Duration(days: 1)));


  await user.addProductToShoppingList(p2!);
  await user.addProductToStorageList(p2!, 1, DateTime.now().add(Duration(days: 1)));

  await user.addProductToShoppingList(p!);
  await user.addProductToStorageList(p!, 11, DateTime.now().add(Duration(days: 100)));


  await user.removeProductFromShoppingListByProduct(p!);
  await user.removeProductFromShoppingListByProduct(p2!);
  await user.removeProductFromStorageListByProduct(
      p!, 10, DateTime.now().add(Duration(days: 100)));
  await user.removeProductFromStorageListByProduct(
      p2!, 5, DateTime.now().add(Duration(days: 1)));*/

}

class User {
  String uid;
  late DocumentReference documentReference;
  static String storageArrayName = "StorageList";
  static String shoppingArrayList = "ShoppingList";

  User(this.uid) {
    _addUserToFirestore();
  }

  void _addUserToFirestore() async {
    documentReference = users.doc(uid);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (!documentSnapshot.exists) {
      await documentReference.set({
        'email': FirebaseAuth.instance.currentUser!.email,
      });
    }
    _addDeviceToFirestore();
  }

  void _addDeviceToFirestore() async {
    // Aggiungi l'elemento all'array nel documento
    await documentReference.update({
      'deviceId':
      FieldValue.arrayUnion([await FirebaseMessaging.instance.getToken()])
    });
  }

  Future<void> addProductToShoppingList(Product product) async {
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(shoppingArrayList)) {
      await documentReference.update({shoppingArrayList: []});
      documentSnapshot = await documentReference.get();
      data = documentSnapshot.data() as Map<String, dynamic>;
    }

    if (!data[shoppingArrayList].contains(product.barcode)) {
      await documentReference.update({
        shoppingArrayList: FieldValue.arrayUnion([product.barcode])
      });
    }
  }

  Future<void> removeProductFromShoppingListByProduct(Product product) {
    return removeProductFromShoppingListByBarcode(product.barcode!);
  }

  Future<List<String>> getShoppingList()async{
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(shoppingArrayList)) {
      return [];
    }
    List<String> r = [];
    data[shoppingArrayList].forEach((instance) {
      r.add(instance);
    });

    return r;
  }

  Future<void> removeProductFromShoppingListByBarcode(String barcode) async {

    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(shoppingArrayList)) return;

    data[shoppingArrayList].removeWhere((row) => row == barcode);
    await documentReference.update({shoppingArrayList: data[shoppingArrayList]});
  }

  Future<void> addProductToStorageList(Product product, int quantity,
      DateTime expiration) async {

    DateFormat formatter = DateFormat('dd-MM-yyyy');

    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(storageArrayName)) {
      await documentReference.update({storageArrayName: []});
      documentSnapshot = await documentReference.get();
      data = documentSnapshot.data() as Map<String, dynamic>;
    }

    //List<dynamic> fieldList = data[storageArrayName];

    bool added = false;
    data[storageArrayName].forEach((instance) {
      if (instance['barcode'] == product.barcode &&
          instance['expiration'] == formatter.format(expiration)) {
        instance['quantity'] += quantity;
        added = true;
      }
    });
    if (!added) {
      data[storageArrayName].add({
        'barcode': product.barcode,
        'quantity': quantity,
        'expiration': formatter.format(expiration)
      });
    }

    await documentReference.update({storageArrayName: data[storageArrayName]});
  }

  Future<List<String>> getStorageBarcodeList()async{
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(storageArrayName)) {
      return [];
    }
    List<String> r = [];
    data[storageArrayName].forEach((instance) {
      r.add(instance);
    });

    return r;
  }

  Future<void> removeProductFromStorageListByProduct(Product product,
      int quantity, DateTime expiration) {
    return removeProductFromStorageListByBarcode(
        product.barcode!, quantity, expiration);
  }

  Future<void> removeProductFromStorageListByBarcode(String barcode,
      int quantity, DateTime expiration) async {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(storageArrayName)) {
      return;
    }

    data[storageArrayName].forEach((instance) {
      if (instance['barcode'] == barcode &&
          instance['expiration'] == formatter.format(expiration)) {
        instance['quantity'] -= quantity;
      }
    });
    //data[array_name].removeWhere((element) => element['quantity'] <= 0);

    int i = 0;
    while(i < data[storageArrayName].length){
      if(data[storageArrayName][i]['quantity'] <= 0)
        data[storageArrayName].remove(data[storageArrayName][i]);
      else
        i++;
    }

    await documentReference.update({storageArrayName: data[storageArrayName]});
  }

  static User getActualUser() {
    return User(FirebaseAuth.instance.currentUser!.uid);
  }
}
