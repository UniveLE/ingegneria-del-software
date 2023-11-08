// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../_utils/user.dart';

class Storage extends StatefulWidget {
  const Storage({Key? key}) : super(key: key);

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  int cnt = 0;

  void _incrementcount() {
    setState(() {
      cnt++;
    });
  }

  void _dicrementcount() {
    setState(() {
      if (cnt > 0) {
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
  late List storageList;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: SingleChildScrollView(
            child: FutureBuilder(
                future: User.getActualUser().getStorageList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    storageList = snapshot.data;
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
                              mainAxisExtent: 290),
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
                                        "${storageList[index]['product'].imageFrontUrl}",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 28, right: 28),
                                    //height: 30,
                                    width: 132,
                                    child: Text(
                                      "${storageList[index]['product'].productName}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "AirbnbCereal_W_Md",
                                          color: notifire
                                              .textshscreenprimerycolor),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 28, right: 28, top: 5),
                                    //height: 30,
                                    width: 132,
                                    child: Text(
                                      "Scadenza: ${storageList[index]['expiration']}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "AirbnbCereal_W_Md",
                                          color: notifire
                                              .textshscreenprimerycolor),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 28, right: 28, top: 5),
                                    //height: 30,
                                    width: 132,
                                    child: Text(
                                      "Quantità: ${storageList[index]['quantity']}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "AirbnbCereal_W_Md",
                                          color: notifire
                                              .textshscreenprimerycolor),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        textStyle:
                                        const TextStyle(fontSize: 14),
                                        backgroundColor: Colors.green),
                                    onPressed: () {
                                      cnt = storageList[index]['quantity'];
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
                                                                child: Image.asset(
                                                                    "assets/Line.png"),
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
                                                                        itemCount: storageList[
                                                                        index]['product']
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
                                                                                      child: Image.network("${storageList[index]['product'].images![i].url}"),
                                                                                    ),
                                                                                  ],
                                                                                ),
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
                                                                          //height: 30,
                                                                          width: 220,
                                                                          child: Text(
                                                                              "${storageList[index]['product'].productName}",
                                                                              style: TextStyle(
                                                                                  fontSize:
                                                                                  18,
                                                                                  color: notifire
                                                                                      .textshscreenprimerycolor,
                                                                                  fontFamily:
                                                                                  "AirbnbCereal_W_Md")),
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .only(
                                                                              left: 28,
                                                                              top: 20,
                                                                              right: 28,
                                                                          bottom: 15),
                                                                          //height: 30,
                                                                          width: 220,
                                                                          child: Text(
                                                                              "Cambia la quantità disponibile:",
                                                                              style: TextStyle(
                                                                                  fontSize:
                                                                                  14,
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
                                                                    onPressed:
                                                                        () async {
                                                                          if(cnt < storageList[index]['quantity']){
                                                                            await User.getActualUser().removeProductFromStorageListByProduct(storageList[index]['product'], (storageList[index]['quantity'] - cnt).abs(), User.toDateTime(storageList[index]['expiration']));
                                                                          }else if(cnt > storageList[index]['quantity']){
                                                                            await User.getActualUser().addProductToStorageList(storageList[index]['product'], (cnt - storageList[index]['quantity']).toInt(), User.toDateTime(storageList[index]['expiration']));
                                                                          }
                                                                          Navigator.pop(context);
                                                                    },
                                                                    child: Text("Modifica"),
                                                                    style: ElevatedButton.styleFrom(
                                                                        textStyle:
                                                                        const TextStyle(
                                                                            fontSize:
                                                                            14),
                                                                        backgroundColor:
                                                                        Colors
                                                                            .green),
                                                                  )
                                                                ])
                                                              ])
                                                            ]))
                                                      ])));
                                            });
                                          }).then((_) => setState(() {}));
                                    },
                                    child: const Text('Cambia quantità'),
                                  ),
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
}
