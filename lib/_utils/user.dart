import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:myfoodtracker/_utils/food_service.dart';
import 'package:myfoodtracker/_utils/model/fidelity_card.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:intl/intl.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class User {
  String uid;
  late DocumentReference documentReference;
  static String storageArrayName = "StorageList";
  static String shoppingArrayList = "ShoppingList";
  static DateFormat formatter = DateFormat('dd-MM-yyyy');

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

  Future<void> addFidelityCard(FidelityCard card) async {
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey('FidelityCards')) {
      await documentReference.update({'FidelityCards': []});
      documentSnapshot = await documentReference.get();
      data = documentSnapshot.data() as Map<String, dynamic>;
    }

    if (!data['FidelityCards'].contains(card.code)) {
      Map<String, dynamic> mcard = {'name': card.name, 'code': card.code};
      await documentReference.update({
        'FidelityCards': FieldValue.arrayUnion([mcard])
      });
    }
  }

  Future<void> deleteFidelityCard(FidelityCard card) async {}

  Future<List<FidelityCard>> getFidelityCards() async {
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    List<FidelityCard> cards = [];

    if (!data.containsKey('FidelityCards')) {
      return cards;
    }

    for (int i = 0; i < data['FidelityCards'].length; i++) {
      cards.add(FidelityCard(
          name: data['FidelityCards'][i]['name'],
          code: data['FidelityCards'][i]['code']));
    }

    return cards;
  }

  Future<void> removeFidelityCard(String code) async {
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey('FidelityCards')) {
      return;
    }

    data['FidelityCards'].removeWhere((row) => row['code'] == code);
    await documentReference.update({'FidelityCards': data['FidelityCards']});
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

  Future<List<dynamic>> getShoppingList() async {
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(shoppingArrayList)) {
      return [];
    }
    List<Product> r = [];
    /*await data[shoppingArrayList].forEach((instance) async {
      Product? p = await FoodService.getProduct(instance);
      print(p);
      if (p != null) {
        r.add(p);
      }
    });*/

    for (int i = 0; i < data[shoppingArrayList].length; i++) {
      Product? p = await FoodService.getProduct(data[shoppingArrayList][i]);
      if (p != null) {
        r.add(p);
      }
    }

    return r;
  }

  Future<void> removeProductFromShoppingListByBarcode(String barcode) async {
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(shoppingArrayList)) return;

    data[shoppingArrayList].removeWhere((row) => row == barcode);
    await documentReference
        .update({shoppingArrayList: data[shoppingArrayList]});
  }

  Future<void> addProductToStorageList(
      Product product, int quantity, DateTime expiration) async {
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

  Future<List> getStorageList() async {
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    if (!data.containsKey(storageArrayName)) {
      return [];
    }
    List r = [];
    /*await data[storageArrayName].forEach((instance) async {
      Product? p = await FoodService.getProduct(instance['barcode']);
      print(p);
      print(p.runtimeType);
      if (p != null) {
        r.add({
          'product': p,
          'expiration': instance['expiration'],
          'quantity': instance['quantity']
        });
      }
    });*/

    for (int i = 0; i < data[storageArrayName].length; i++) {
      Product? p =
          await FoodService.getProduct(data[storageArrayName][i]['barcode']);
      if (p != null) {
        r.add({
          'product': p,
          'expiration': data[storageArrayName][i]['expiration'],
          'quantity': data[storageArrayName][i]['quantity']
        });
      }
    }

    return r;
  }

  Future<void> removeProductFromStorageListByProduct(
      Product product, int quantity, DateTime expiration) {
    return removeProductFromStorageListByBarcode(
        product.barcode!, quantity, expiration);
  }

  Future<void> removeProductFromStorageListByBarcode(
      String barcode, int quantity, DateTime expiration) async {
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
    while (i < data[storageArrayName].length) {
      if (data[storageArrayName][i]['quantity'] <= 0)
        data[storageArrayName].remove(data[storageArrayName][i]);
      else
        i++;
    }

    await documentReference.update({storageArrayName: data[storageArrayName]});
  }

  static User getActualUser() {
    return User(FirebaseAuth.instance.currentUser!.uid);
  }

  static DateTime toDateTime(String dm) {
    return formatter.parse(dm);
  }
}
