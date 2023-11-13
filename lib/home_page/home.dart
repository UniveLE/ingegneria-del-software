// ignore_for_file: file_names
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfoodtracker/_utils/food_service.dart';
import 'package:myfoodtracker/home_page/search.dart';
import 'package:myfoodtracker/home_page/search_result.dart';
import 'package:myfoodtracker/showModalProduct.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:myfoodtracker/home_page/fidelity_card.dart';
import 'package:openfoodfacts/openfoodfacts.dart' as off;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen/welcome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool status = false;
  int cnt = 0;
  bool all = false;
  bool you = true;
  bool artichoke = true;
  bool barcoli = true;
  late Colornotifire notifire;

  late TabController _tabController;

  List<Slid> _slides = [];

  final ScrollController _gridViewScrollController = ScrollController();
  List<off.Product>? mostScanned = [];
  int _page = 0;
  User currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _slides = [
      Slid("assets/veg1.png"),
      Slid("assets/veg1.png"),
      Slid("assets/veg1.png"),
    ];
    getProducts();
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _gridViewScrollController.addListener(() {
      if (_gridViewScrollController.position.pixels >=
          _gridViewScrollController.position.maxScrollExtent) {
        _page++;
        getProducts();
      }
    });
  }

  void getProducts() async {
    var products = await FoodService.searchProduct(size: 6, page: ++_page);
    if (products != null) {
      setState(() {
        mostScanned!.addAll(products);
      });
    } else {
      --_page;
    }
  }

  int _currentPage = 0;
  int currentIndex = 0;

//  late PageController _controller;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  exit(0);
                }, // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: notifire.textshscreenprimerycolor),

            // automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: notifire.spleshscreenprimerycolor,
            actions: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 30, left: 10),
                  width: 120,
                  child: Text("MyFoodTracker",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Bd",
                          fontSize: 15,
                          color: notifire.textshscreenprimerycolor)),
                ),
              ),
            ]),
        drawer: Drawer(
            child: Container(
              //  height: 90,
                width: 50,
                color: notifire.blackwhite,
                child: Column(children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 55, left: 20),
                            height: 15,
                            width: 15,
                            child: Image.asset(
                              "assets/logo/cansel.png",
                              fit: BoxFit.cover,
                              color: notifire.textshscreenprimerycolor,
                            ),
                          ),
                        ),
                      ]),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    height: 80,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: notifire.topscreenprimerycolor,
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 28, top: 15, bottom: 15),
                            height: 50,
                            width: 50,
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/profile.png"),
                            )),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 15, right: 30),
                              height: 30,
                              width: 128,
                              child: Text(
                                currentUser.displayName.toString(),
                                //getData.read("user")["name"],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "AirbnbCereal_W_Bd",
                                    color: notifire.textshscreenprimerycolor),
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 15, right: 30),
                              height: 20,
                              width: 130,
                              child: Text(
                                currentUser.email.toString(),
                                // getData.read("user")["email"],
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    color: notifire.mintextscreenprimerycolor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  /*Container(
                    margin: EdgeInsets.only(left: 13),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const FidelityCard();
                          },
                        ));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          "assets/logo/voucher.png",
                          height: 20,
                          width: 20,
                          color: notifire.mintextscreenprimerycolor,
                        ),
                        title: Text(
                          "Carte fedeltà",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.textshscreenprimerycolor,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),*/
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 28, right: 25),
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/logo/dark.png"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 45),
                        child: Text(
                          "Modalità scura",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.textshscreenprimerycolor,
                              fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 62,
                        child: Transform.scale(
                          alignment: Alignment.centerRight,
                          scale: 0.7,
                          child: CupertinoSwitch(
                            // iconOn: Icons.nightlight,
                            // iconOff: Icons.sunny,
                            // animationDuration:
                            //     const Duration(milliseconds: 200),
                            // textOn: 'Dark',
                            // textOff: 'Light',
                            // colorOn: const Color(0xff242424),
                            // colorOff: const Color(0xff1F75EC),
                            value: status,
                            onChanged: (bool value) async {
                              setState(() {
                                status = value;
                              });
                              final prefs =
                              await SharedPreferences.getInstance();
                              setState(
                                    () {
                                  notifire.setlsDark = value;
                                  prefs.setBool("setIsDark", value);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 28, right: 25),
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/logo/language_1.png"),
                      ),
                      InkWell(
                        onTap: () {
                          /*Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Language();
                            },
                          ));*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, right: 20),
                          height: 30,
                          width: 150,
                          child: Text(
                            "Cambia lingua",
                            style: TextStyle(
                                fontSize: 14,
                                color: notifire.textshscreenprimerycolor,
                                fontFamily: "AirbnbCereal_W_Md"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: 30,
                        child: Image.asset("assets/flag_1.png"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      await firebaseAuth.FirebaseAuth.instance.signOut();
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Onbording(),
                      ));
                    },
                    child: const Text('Logout'),
                  ),
                ]))),
        backgroundColor: notifire.blackwhite,
        body: SingleChildScrollView(
          controller: _gridViewScrollController,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                height: 50,
                width: 319,
                decoration: BoxDecoration(
                  color: notifire.topscreenprimerycolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Search();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Search();
                            },
                          ));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, bottom: 15),
                            height: 50,
                            width: 200,
                            child: Text(
                              "Ricerca prodotto...",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "AirbnbCereal_W_Md",
                                  color: notifire.mintextscreenprimerycolor),
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 80),
                        child: Icon(Icons.search,
                            color: notifire.mintextscreenprimerycolor),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin:
                    const EdgeInsets.only(left: 28, top: 28, right: 130),
                    height: 30,
                    width: 200,
                    child: Text(
                      "Cosa stai cercando?",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Bd",
                          fontSize: 16,
                          color: notifire.textshscreenprimerycolor),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, top: 20),
                            height: 60,
                            width: 60,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const SearchResult(
                                        title: 'Vegetali',
                                        category: off.PnnsGroup2.VEGETABLES);
                                  },
                                ));
                              },
                              child: Image.asset(
                                "assets/vegeteble.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25, top: 12),
                            height: 20,
                            width: 60,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const SearchResult(
                                        title: 'Vegetali',
                                        category: off.PnnsGroup2.VEGETABLES);
                                  },
                                ));
                              },
                              child: Text("Vegano",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color:
                                      notifire.textshscreenprimerycolor)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Carne',
                                      category: off.PnnsGroup2.MEAT);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20, top: 28),
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/meat.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Carne',
                                      category: off.PnnsGroup2.MEAT);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 40, top: 12),
                              height: 20,
                              width: 50,
                              child: Text("Carne",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color:
                                      notifire.textshscreenprimerycolor)),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Frutta',
                                      category: off.PnnsGroup2.FRUITS);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 15, top: 20),
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/fruit.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Frutta',
                                      category: off.PnnsGroup2.FRUITS);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 35, top: 12),
                              height: 20,
                              width: 55,
                              child: Text("Frutta",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color:
                                      notifire.textshscreenprimerycolor)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Dolci',
                                      category: off.PnnsGroup2.SWEETS);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, top: 28),
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/frozen.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Dolci',
                                      category: off.PnnsGroup2.SWEETS);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 30, top: 12),
                              height: 20,
                              width: 60,
                              child: Text("Dolci",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color:
                                      notifire.textshscreenprimerycolor)),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Mare',
                                      category:
                                      off.PnnsGroup2.FISH_AND_SEAFOOD);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/sea_food.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Mare',
                                      category:
                                      off.PnnsGroup2.FISH_AND_SEAFOOD);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, top: 12),
                              height: 20,
                              width: 60,
                              child: Text("Mare",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color:
                                      notifire.textshscreenprimerycolor)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Pane',
                                      category: off.PnnsGroup2.BREAD);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 28),
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/bread.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      title: 'Pane',
                                      category: off.PnnsGroup2.BREAD);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20, top: 12),
                              height: 20,
                              width: 50,
                              child: Text("Pane",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color:
                                      notifire.textshscreenprimerycolor)),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      category:
                                      off.PnnsGroup2.BREAKFAST_CEREALS);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 20, top: 20),
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/milk_egg.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      category:
                                      off.PnnsGroup2.BREAKFAST_CEREALS);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 15, top: 12, right: 20),
                              height: 20,
                              width: 60,
                              child: Text("Uova",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color:
                                      notifire.textshscreenprimerycolor)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      category: off.PnnsGroup2.VEGETABLES);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 20, top: 28),
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/organic.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SearchResult(
                                      category: off.PnnsGroup2.VEGETABLES);
                                },
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, top: 12, right: 20),
                              height: 20,
                              width: 60,
                              child: Text("Verdura",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color:
                                      notifire.textshscreenprimerycolor)),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin:
                    const EdgeInsets.only(left: 28, right: 200, top: 28),
                    height: 30,
                    width: 250,
                    child: Text(
                      "Più popolari",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "AirbnbCereal_W_Bd",
                          color: notifire.textshscreenprimerycolor),
                    ),
                  )
                ],
              ),
              Column(children: [
                Container(
                  // margin: EdgeInsets.only(top: 10),
                  height: _page * 680,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  // color: Colors.blue,
                  color: notifire.spleshscreenprimerycolor,

                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        mainAxisExtent: 230),
                    itemCount: mostScanned?.length,
                    addRepaintBoundaries: true,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: notifire.topscreenprimerycolor)),
                          child: InkWell(
                            onTap: () {
                              showProductModal(mostScanned![index], context);
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  height: 128,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(mostScanned![
                                          index]
                                              .imageFrontUrl ??
                                              'https://static.openfoodfacts.org/images/misc/openfoodfacts-logo-en-178x150.png'),
                                          fit: BoxFit.cover),
                                      border: Border.all(
                                          width: 1,
                                          color:
                                          notifire.topscreenprimerycolor)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 28, right: 28),
                                  height: 60,
                                  width: 132,
                                  child: Text(
                                    "${mostScanned?[index].productName}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "AirbnbCereal_W_Md",
                                        color:
                                        notifire.textshscreenprimerycolor),
                                  ),
                                ),
                                /*Container(
                              margin:
                                  const EdgeInsets.only(left: 28, right: 28),
                              height: 20,
                              width: 132,
                              child: Text(
                                "${products?[index].productName}",
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    fontSize: 12,
                                    color: notifire.mintextscreenprimerycolor),
                              ),
                            ),*/
                                //TODO: rimuovere row?
                                Row(children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 30),
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                      "assets/plus1.png",
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ]),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  Widget _buildSlide(Slid slid) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: Column(
        children: <Widget>[
          // SizedBox(height: Get.height * 0.12),

          // ignore: sized_box_for_whitespace
          Padding(
            padding: const EdgeInsets.all(8.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              // height: Get.height / 2, //imagee size
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      slid.image,
                      fit: BoxFit.cover,
                      //    height: Get.height / 1.9,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: Get.height * 0.05,
          // ),
        ],
      ),
    );
  }

  _handlingOnPageChanged(int index, StateSetter setState1) {
    // print('handle page--->$index');
    // setState(() => _currentPage = index);

    setState1(() => _currentPage = index);
    //print('handle _currentPage--->$_currentPage');
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        // ignore: curly_braces_in_flow_control_structures
        row.children.add(const SizedBox(
          width: 10,
        ));
      // setState1;
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    // print("index--->$index");
    // print("currentIndex--->$_currentPage");

    return Container(
      width: index == _currentPage ? 12 : 8,
      height: index == _currentPage ? 12 : 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? const Color(0xff00AB67)
              : const Color(0xff00AB67).withOpacity(0.2)),
    );
  }
}

class List1 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List1({this.image1, this.name1, this.name2, this.name3});
}

class List2 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List2({this.image1, this.name1, this.name2, this.name3});
}

class List3 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List3({this.image1, this.name1, this.name2, this.name3});
}

class List4 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List4({this.image1, this.name1, this.name2, this.name3});
}

class Slid {
  String image;

  Slid(this.image);
}
