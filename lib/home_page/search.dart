// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:myfoodtracker/_utils/food_service.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../showModalProduct.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Colornotifire notifire;
  List<Product>? products = [];
  dynamic dropdownValue;

  @override
  void initState() {
    super.initState();
      FoodService.searchProduct(name: '').then((result) => {setState(() {products = result;})});
  }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setlsDark = false;
    } else {
      notifire.setlsDark = previusstate;
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);

    String searchText = "";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: notifire.spleshscreenprimerycolor,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 50,
          actions: [
            Row(children: [
              // SizedBox(width: 10,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 10),
                  height: 10,
                  child: Icon(Icons.arrow_back,
                      size: 20, color: notifire.textshscreenprimerycolor),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 160, top: 8, left: 110, bottom: 10),
                child: Center(
                  child: Text(
                    "Search",
                    style: TextStyle(
                        fontSize: 14,
                        color: notifire.textshscreenprimerycolor,
                        fontFamily: "AirbnbCereal_W_Bd"),
                  ),
                ),
              ),
            ]),
          ],
        ),
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 8),
                        height: 50,
                        width: 319,
                        decoration: BoxDecoration(
                          color: notifire.topscreenprimerycolor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              height: 50,
                              width: 200,
                              child: TextField(
                                onChanged: (text) {
                                  searchText = text;
                                    if (dropdownValue == null) {
                                      FoodService.searchProduct(name: text)
                                          .then(
                                              (result) => {setState(() {products = result;})});
                                    } else {
                                      FoodService.searchProduct(
                                              name: text,
                                              category2: dropdownValue)
                                          .then(
                                              (result) => {setState(() {products = result;})});
                                    }
                                    //FoodService.getProduct('8013355998832').then((result) => {products?.add(result!)});
                                },
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: "Search anything",
                                    hintStyle: TextStyle(
                                        color: Color(0xff808080), fontSize: 14)
                                    //  icon: Icon(Icons.search),
                                    //  labelText: "user name"
                                    ),
                              ),
                            ),
                            /*Container(
                              margin: const EdgeInsets.only(left: 63),
                              child: const Icon(Icons.search,
                                  color: Color(0xffCCCCCC)),
                            ),*/
                            Container(
                                margin: const EdgeInsets.only(left: 55),
                                child: IconButton(
                                  onPressed: () async {
                                    try {
                                      String barcode =
                                          await FlutterBarcodeScanner
                                              .scanBarcode("#ff6666", "Annulla",
                                                  false, ScanMode.BARCODE);
                                      if (barcode.length >= 6) {
                                        FoodService.getProduct(barcode)
                                            .then((result) => {
                                                  if (result != null)
                                                    {
                                                      setState(() async{
                                                        products?.clear();
                                                        products = [result];
                                                      })
                                                    }
                                                });
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  icon: const Icon(Icons.photo_camera,
                                      color: Color(0xffCCCCCC)),
                                )),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text("Seleziona categoria"),
                          DropdownButton(
                            value: dropdownValue,
                            items: const [
                              DropdownMenuItem(
                                  child: Text("Tutte"), value: null),
                              DropdownMenuItem(
                                  child: Text("Succhi di frutta"),
                                  value: PnnsGroup2.FRUIT_JUICES),
                              DropdownMenuItem(
                                  child: Text("Bevande alcoliche"),
                                  value: PnnsGroup2.ALCOHOLIC_BEVERAGES),
                              DropdownMenuItem(
                                  child: Text("Bevande dolci"),
                                  value: PnnsGroup2.SWEETENED_BEVERAGES),
                              DropdownMenuItem(
                                  child: Text("Bevade non dolci"),
                                  value: PnnsGroup2.UNSWEETENED_BEVERAGES),
                              DropdownMenuItem(
                                  child: Text("Erbe, the e caffè"),
                                  value: PnnsGroup2
                                      .TEAS_AND_HERBAL_TEAS_AND_COFFEES),
                              DropdownMenuItem(
                                  child: Text("Cereali"),
                                  value: PnnsGroup2.CEREALS),
                              DropdownMenuItem(
                                  child: Text("Pasticceria"),
                                  value: PnnsGroup2.PASTRIES),
                              DropdownMenuItem(
                                  child: Text("Patate"),
                                  value: PnnsGroup2.POTATOES),
                              DropdownMenuItem(
                                  child: Text("Pane"), value: PnnsGroup2.BREAD),
                              DropdownMenuItem(
                                  child: Text("Panini"),
                                  value: PnnsGroup2.SANDWICHES),
                              DropdownMenuItem(
                                  child: Text("Zuppe"),
                                  value: PnnsGroup2.SOUPS),
                              DropdownMenuItem(
                                  child: Text("Condimenti e salse"),
                                  value: PnnsGroup2.DRESSINGS_AND_SAUCES),
                              DropdownMenuItem(
                                  child: Text("Carne"), value: PnnsGroup2.MEAT),
                              DropdownMenuItem(
                                  child: Text("Pesce"),
                                  value: PnnsGroup2.FISH_AND_SEAFOOD),
                              DropdownMenuItem(
                                  child: Text("Frutta"),
                                  value: PnnsGroup2.FRUITS),
                              DropdownMenuItem(
                                  child: Text("Vegetali"),
                                  value: PnnsGroup2.VEGETABLES),
                              DropdownMenuItem(
                                  child: Text("Frutta secca"),
                                  value: PnnsGroup2.DRIED_FRUITS),
                              DropdownMenuItem(
                                  child: Text("Legumi"),
                                  value: PnnsGroup2.LEGUMES),
                              DropdownMenuItem(
                                  child: Text("Latticini"),
                                  value: PnnsGroup2.MILK_AND_YOGURT),
                              DropdownMenuItem(
                                  child: Text("Formaggio"),
                                  value: PnnsGroup2.CHEESE),
                              DropdownMenuItem(
                                  child: Text("Antipasti"),
                                  value: PnnsGroup2.APPETIZERS),
                              DropdownMenuItem(
                                  child: Text("Dolci"),
                                  value: PnnsGroup2.SWEETS),
                              DropdownMenuItem(
                                  child: Text("Cioccolato"),
                                  value: PnnsGroup2.CHOCOLATE_PRODUCTS),
                              DropdownMenuItem(
                                  child: Text("Gelato"),
                                  value: PnnsGroup2.ICE_CREAM),
                            ],
                            onChanged: (value) {
                              dropdownValue = value;
                                dropdownValue = value;
                                print(dropdownValue);
                                if (searchText != "") {
                                  FoodService.searchProduct(
                                          name: searchText,
                                          category2: dropdownValue)
                                      .then((result) => {setState(() {products = result;})});
                                } else {
                                   FoodService.searchProduct(
                                          category2: dropdownValue,
                                    name: " ",)
                                      .then((result) => {setState(() {products = result;})});
                                }
                            },
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                        color: notifire.topscreenprimerycolor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 28, left: 28, right: 200),
                        height: 30,
                        width: 130,
                        child: Text(
                          "Risultati",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              fontSize: 16,
                              color: notifire.textshscreenprimerycolor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: products != null ? products?.length : 0,
                (context, index) {
                  return GestureDetector(
                      onTap: () {
                        showProductModal(products![index], context);
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 28, top: 14),
                            height: 50,
                            width: 20,
                            child: products?[index].imageFrontUrl != null
                                ? Image.network(
                                    "${products?[index].imageFrontUrl}")
                                : Image.asset("assets/kiwi.png"),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, right: 150, left: 16),
                                //height: 44,
                                width: 145,
                                child: Text("${products?[index].productName}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            notifire.textshscreenprimerycolor,
                                        fontFamily: "AirbnbCereal_W_Md")),
                              ),
                            ],
                          )
                        ],
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
