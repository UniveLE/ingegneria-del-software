// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);

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
      body: SingleChildScrollView(
        child: Column(
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
                    child: const TextField(
                      decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search anything",
                          hintStyle:
                              TextStyle(color: Color(0xff808080), fontSize: 14)
                          //  icon: Icon(Icons.search),
                          //  labelText: "user name"
                          ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 63),
                    child: const Icon(Icons.search, color: Color(0xffCCCCCC)),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 28, left: 28),
                      height: 30,
                      width: 130,
                      child: Text(
                        "Recent Search",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            fontSize: 16,
                            color: notifire.textshscreenprimerycolor),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 21, left: 142, right: 28),
                      height: 20,
                      width: 31,
                      child: const Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff00AB67),
                            fontFamily: "AirbnbCereal_W_Bk"),
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 28, top: 20),
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                          color: notifire.spleshscreenprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xffEBEBEB), width: 1)),
                      child: Center(
                          child: Text(
                        "Almond",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            color: const Color(0xff808080).withOpacity(0.8),
                            fontSize: 12),
                      )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 20),
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                          color: notifire.spleshscreenprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xffEBEBEB), width: 1)),
                      child: Center(
                          child: Text(
                        "Banana",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            color: const Color(0xff808080).withOpacity(0.8),
                            fontSize: 12),
                      )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 20),
                      height: 40,
                      width: 93,
                      decoration: BoxDecoration(
                          color: notifire.spleshscreenprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xffEBEBEB), width: 1)),
                      child: Center(
                          child: Text(
                        "Cabbage",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            color: const Color(0xff808080).withOpacity(0.8),
                            fontSize: 12),
                      )),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 28, top: 16),
                      height: 40,
                      width: 75,
                      decoration: BoxDecoration(
                          color: notifire.spleshscreenprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xffEBEBEB), width: 1)),
                      child: Center(
                          child: Text(
                        "Garlic",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            color: const Color(0xff808080).withOpacity(0.8),
                            fontSize: 12),
                      )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 16),
                      height: 40,
                      width: 77,
                      decoration: BoxDecoration(
                          color: notifire.spleshscreenprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xffEBEBEB), width: 1)),
                      child: Center(
                          child: Text(
                        "Cacao",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            color: const Color(0xff808080).withOpacity(0.8),
                            fontSize: 12),
                      )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 16),
                      height: 40,
                      width: 93,
                      decoration: BoxDecoration(
                          color: notifire.spleshscreenprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xffEBEBEB), width: 1)),
                      child: Center(
                          child: Text(
                        "Cashew",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            color: const Color(0xff808080).withOpacity(0.8),
                            fontSize: 12),
                      )),
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 28, left: 28, right: 200),
              height: 30,
              width: 130,
              child: Text(
                "Popular Search",
                style: TextStyle(
                    fontFamily: "AirbnbCereal_W_Md",
                    fontSize: 16,
                    color: notifire.textshscreenprimerycolor),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 28, top: 22),
                  height: 12,
                  width: 12,
                  child: Image.asset(
                    "assets/logo/arrow.png",
                    color: const Color(0xffDBDBDB),
                    width: 12,
                    height: 12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 20, right: 30),
                  height: 30,
                  width: 160,
                  child: Center(
                    child: Text(
                      "Pomegranate",
                      style: TextStyle(
                          fontSize: 14,
                          color: notifire.textshscreenprimerycolor,
                          fontFamily: "AirbnbCereal_W_Md"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  height: 20,
                  width: 69,
                  child: Text("10+ Product",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Bk",
                          color: notifire.mintextscreenprimerycolor,
                          fontSize: 12)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 11, top: 17, right: 19),
                  height: 5,
                  width: 6,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: notifire.textshscreenprimerycolor,
                    size: 12.00,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 28, top: 22),
                  height: 12,
                  width: 12,
                  child: Image.asset(
                    "assets/logo/arrow.png",
                    color: const Color(0xffDBDBDB),
                    width: 12,
                    height: 12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 20, right: 30),
                  height: 30,
                  width: 160,
                  child: Center(
                    child: Text(
                      "Sunflower Seeds",
                      style: TextStyle(
                          fontSize: 14,
                          color: notifire.textshscreenprimerycolor,
                          fontFamily: "AirbnbCereal_W_Md"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  height: 20,
                  width: 69,
                  child: Text("17+ Product",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Bk",
                          color: notifire.mintextscreenprimerycolor,
                          fontSize: 12)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 11, top: 17, right: 19),
                  height: 5,
                  width: 6,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: notifire.textshscreenprimerycolor,
                    size: 12.00,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 28, top: 22),
                  height: 12,
                  width: 12,
                  child: Image.asset(
                    "assets/logo/arrow.png",
                    color: const Color(0xffDBDBDB),
                    width: 12,
                    height: 12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 20, right: 30),
                  height: 30,
                  width: 160,
                  child: Center(
                    child: Text(
                      "Blackberry",
                      style: TextStyle(
                          fontSize: 14,
                          color: notifire.textshscreenprimerycolor,
                          fontFamily: "AirbnbCereal_W_Md"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  height: 20,
                  width: 69,
                  child: Text("10+ Product",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Bk",
                          color: notifire.mintextscreenprimerycolor,
                          fontSize: 12)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 11, top: 17, right: 19),
                  height: 5,
                  width: 6,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: notifire.textshscreenprimerycolor,
                    size: 12.00,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 28, left: 28, right: 200),
              height: 30,
              width: 130,
              child: Text(
                "Popular items",
                style: TextStyle(
                    fontFamily: "AirbnbCereal_W_Md",
                    fontSize: 16,
                    color: notifire.textshscreenprimerycolor),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 28, top: 14),
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/corn.png"),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, right: 150, left: 16),
                          height: 24,
                          width: 34,
                          child: Text("Corn",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.textshscreenprimerycolor,
                                  fontFamily: "AirbnbCereal_W_Md")),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 99),
                          height: 22,
                          width: 86,
                          child: Text("4ct, approx 2lb",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  color: notifire.mintextscreenprimerycolor,
                                  fontSize: 12)),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      height: 30,
                      width: 44,
                      child: Text("\$5.99",
                          style: TextStyle(
                              color: notifire.textshscreenprimerycolor,
                              fontFamily: "AirbnbCereal_W_Md",
                              fontSize: 16)),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: 10, top: 20, right: 17),
                      height: 20,
                      width: 19,
                      child: Text("/er",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Bk",
                              color: notifire.mintextscreenprimerycolor)),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 28, top: 14),
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/pepper.png"),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, right: 135, left: 16),
                          height: 24,
                          width: 50,
                          child: Text("Pepper",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.textshscreenprimerycolor,
                                  fontFamily: "AirbnbCereal_W_Md")),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 99),
                          height: 22,
                          width: 86,
                          child: Text("approx 1oz",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  color: notifire.mintextscreenprimerycolor,
                                  fontSize: 12)),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      height: 30,
                      width: 44,
                      child: Text("\$0.49",
                          style: TextStyle(
                              color: notifire.textshscreenprimerycolor,
                              fontFamily: "AirbnbCereal_W_Md",
                              fontSize: 16)),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: 10, top: 20, right: 17),
                      height: 20,
                      width: 19,
                      child: Text("/er",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Bk",
                              color: notifire.mintextscreenprimerycolor)),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 28, top: 14),
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/kiw.png"),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, right: 110, left: 16),
                          height: 24,
                          width: 70,
                          child: Text("Kiwifruit",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.textshscreenprimerycolor,
                                  fontFamily: "AirbnbCereal_W_Md")),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 99),
                          height: 22,
                          width: 86,
                          child: Text("approx 0.25lb",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  color: notifire.mintextscreenprimerycolor,
                                  fontSize: 12)),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      height: 30,
                      width: 44,
                      child: Text("\$0.89",
                          style: TextStyle(
                              color: notifire.textshscreenprimerycolor,
                              fontFamily: "AirbnbCereal_W_Md",
                              fontSize: 16)),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: 10, top: 20, right: 17),
                      height: 20,
                      width: 20,
                      child: Text("/er",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Bk",
                              color: notifire.mintextscreenprimerycolor)),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 28, left: 28, right: 180),
              height: 30,
              width: 190,
              child: Text(
                "Explore Categories",
                style: TextStyle(
                    fontFamily: "AirbnbCereal_W_Md",
                    fontSize: 16,
                    color: notifire.textshscreenprimerycolor),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/vegeteble.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 12),
                      height: 20,
                      width: 60,
                      child: Text("vegetable",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.textshscreenprimerycolor)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 28),
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/meat.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, top: 12),
                      height: 20,
                      width: 50,
                      child: Text("Meat",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.textshscreenprimerycolor)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/fruit.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 12),
                      height: 20,
                      width: 55,
                      child: Text("Fruit",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.textshscreenprimerycolor)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 12, right: 15, top: 28),
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/frozen.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 12),
                      height: 20,
                      width: 60,
                      child: Text("Frozen",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.textshscreenprimerycolor)),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
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
