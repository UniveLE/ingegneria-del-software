// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:openfoodfacts/openfoodfacts.dart' as openFoodFact;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../_utils/food_service.dart';
import '../_utils/user.dart';

class Artichoke extends StatefulWidget {
  const Artichoke({Key? key}) : super(key: key);

  @override
  State<Artichoke> createState() => _ArtichokeState();
}

class _ArtichokeState extends State<Artichoke> {
  DateTime selectedDate = DateTime.now();
  int cnt = 1;
  late List shoppingList;

  void _incrementcount() {
    setState(() {
      cnt++;
    });
  }

  void _dicrementcount() {
    setState(() {
      if (cnt > 1) {
        cnt--;
      }
    });
  }

  late Colornotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setlsDark = false;
    } else {
      notifire.setlsDark = previusstate;
    }
  }

  //List<dynamic> ditails3 = User.getActualUser().getShoppingList();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: SingleChildScrollView(
            child: FutureBuilder(
                future: User.getActualUser().getShoppingList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    shoppingList = snapshot.data;

                    print(shoppingList);
                    return Column(children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 680,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.blue,
                        color: notifire.spleshscreenprimerycolor,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  mainAxisExtent: 270),
                          itemCount: snapshot.data.length,
                          addRepaintBoundaries: true,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: notifire.topscreenprimerycolor)),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      height: 128,
                                      width: 120,
                                      child: Image.network(
                                        "${shoppingList[index].imageFrontUrl}",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 28, right: 28),
                                    height: 30,
                                    width: 132,
                                    child: Text(
                                      "${shoppingList[index].productName}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "AirbnbCereal_W_Md",
                                          color: notifire
                                              .textshscreenprimerycolor),
                                    ),
                                  ),
                                  /*InkWell(
                                    onTap: () {
                                      print("cliccato");
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (BuildContext context) {
                                          return ProductInfoWidget(shoppingList[index]);
                                          });
                                        },
                                    child: Column(children: [*/
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        textStyle:
                                            const TextStyle(fontSize: 14),
                                        backgroundColor: Colors.green),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter
                                                        setState /*You can rename this!*/) {
                                              return SizedBox(
                                                  child: SingleChildScrollView(
                                                      child: Column(children: [
                                                Container(
                                                    margin: const EdgeInsets
                                                        .only(top: 70),
                                                    height: 630,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        color: notifire
                                                            .spleshscreenprimerycolor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        28),
                                                                topRight: Radius
                                                                    .circular(
                                                                        28))),
                                                    child: Column(children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 30),
                                                        height: 5,
                                                        width: 50,
                                                        child: Image.network(
                                                            "${shoppingList[index].imageFrontUrl}"),
                                                      ),
                                                      Column(children: [
                                                        Center(
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 18,
                                                                    top: 20,
                                                                    right: 18),
                                                            height: 319,
                                                            width: 319,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xffF2FBF7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: PageView
                                                                .builder(
                                                                    itemCount: shoppingList[
                                                                            index]
                                                                        .images!
                                                                        .length,
                                                                    itemBuilder:
                                                                        (_, i) {
                                                                      return Column(
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Container(
                                                                                  margin: const EdgeInsets.only(left: 20, right: 20),
                                                                                  height: 270,
                                                                                  width: 270,
                                                                                  //color: Colors.blueAccent,
                                                                                  child: Image.network("${shoppingList[index].images![i].url}"),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            /*Row(
                                          children: [
                                            Center(
                                              child: Container(
                                                margin: const EdgeInsets.only(left: 130, right: 120),
                                                height: 8,
                                                width: 46,
                                                child: Image.network(
                                                  "${product.images![i].url}",
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),*/
                                                                          ]);
                                                                    }),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Container(
                                                                  margin: const EdgeInsets
                                                                      .only(
                                                                      left: 28,
                                                                      top: 20,
                                                                      right:
                                                                          28),
                                                                  height: 30,
                                                                  width: 220,
                                                                  child: Text(
                                                                      "${shoppingList[index].productName}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color: notifire
                                                                              .textshscreenprimerycolor,
                                                                          fontFamily:
                                                                              "AirbnbCereal_W_Md")),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Column(children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 20),
                                                            height: 50,
                                                            width: 375,
                                                            child: Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    return setState(
                                                                        () {
                                                                      _dicrementcount();
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    margin: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            77),
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/logo/mainas.png"),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 50,
                                                                  width: 50,
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    "$cnt",
                                                                    style: TextStyle(
                                                                        color: notifire
                                                                            .textshscreenprimerycolor),
                                                                  )),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    return setState(
                                                                        () {
                                                                      _incrementcount();
                                                                    });
                                                                  },
                                                                  child:
                                                                      SizedBox(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/logo/plus_1.png"),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () =>
                                                                _selectDate(
                                                                    context),
                                                            child: const Text(
                                                                'Seleziona la scadenza'),
                                                          ),
                                                          ElevatedButton(
                                                              onPressed:() async {
                                                                await User.getActualUser().addProductToStorageList(shoppingList[index],cnt, selectedDate);
                                                                await User.getActualUser().removeProductFromShoppingListByProduct(shoppingList[index]);
                                                                shoppingList = await User.getActualUser().getShoppingList();
                                                                Navigator.pop(context);
                                                              },
                                                              child: Text("Compra!"))
                                                        ])
                                                      ])
                                                    ]))
                                              ])));
                                            });
                                          }).then((_) => setState(() {}));
                                    },
                                    child: const Text('Compra'),
                                  ),
                                  //const SizedBox(height: 30),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        textStyle:
                                            const TextStyle(fontSize: 14),
                                        backgroundColor: Colors.red),
                                    onPressed: () async {
                                      await User.getActualUser()
                                          .removeProductFromShoppingListByProduct(
                                              shoppingList[index]);
                                      shoppingList = await User.getActualUser()
                                          .getShoppingList();
                                      setState(() {});
                                    },
                                    child: const Text('Elimina'),
                                  ),
                                  //]),
                                  //)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ]);
                  } else {
                    return SizedBox();
                  }
                })));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
