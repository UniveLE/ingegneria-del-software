// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/notification/promo_ditail.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Promocode extends StatefulWidget {
  const Promocode({Key? key}) : super(key: key);

  @override
  State<Promocode> createState() => _PromocodeState();
}

class _PromocodeState extends State<Promocode> {
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
      bottomNavigationBar: SizedBox(
        height: 90,
        width: 375,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 28, top: 20, right: 90),
                  height: 20,
                  width: 83,
                  child: Text(
                    "Promo Applied",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "AirbnbCereal_W_Bk",
                        color: notifire.mintextscreenprimerycolor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 28, right: 55),
                  height: 30,
                  width: 119,
                  child: Text(
                    "Discount 10%",
                    style: TextStyle(
                        fontFamily: "AirbnbCereal_W_Md",
                        fontSize: 18,
                        color: notifire.textshscreenprimerycolor),
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Promoditail();
                  },
                ));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 28),
                height: 50,
                width: 128,
                decoration: BoxDecoration(
                    color: const Color(0xff00AB67),
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                    child: Text(
                  "Apply Code",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "AirbnbCereal_W_Bk",
                      color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: notifire.spleshscreenprimerycolor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 50,
        actions: [
          Row(children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(
                    top: 8, right: 10, left: 10, bottom: 20),
                height: 8,
                width: 10,
                child: Icon(Icons.arrow_back,
                    size: 20, color: notifire.textshscreenprimerycolor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 80, right: 100, top: 8, bottom: 10),
              child: Center(
                child: Text(
                  "Use Promotional Code",
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
                          hintText: "Search in favorite list",
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
              margin: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 28, right: 28),
              height: 80,
              width: 309,
              decoration: BoxDecoration(
                  color: const Color(0xff00AB67).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: const Color(0xff00AB67))),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 28),
                        height: 30,
                        width: 225,
                        child: Text(
                          "DISC10OFF",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              fontSize: 14,
                              color: notifire.textshscreenprimerycolor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12, left: 28),
                        height: 20,
                        width: 225,
                        child: const Text(
                          "Special offer up to 50% off.",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Bk",
                              color: Color(0xff808080)),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 22),
                    child: const Icon(Icons.done, color: Color(0xff00AB67)),
                  )
                ],
              ),
            ),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
            Container(
              margin: const EdgeInsets.only(left: 28, top: 28, right: 220),
              height: 30,
              width: 105,
              child: Text(
                "Your Voucher",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "AirbnbCereal_W_Bd",
                    color: notifire.textshscreenprimerycolor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 80,
              width: 319,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: notifire.topscreenprimerycolor, width: 1)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    height: 30,
                    width: 319,
                    child: Text(
                      "Summer Special Cashback",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Md",
                          color: notifire.textshscreenprimerycolor,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 279,
                    child: Text(
                      "Get \$10 cashback",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "AirbnbCereal_W_Bk",
                          color: Color(0xff808080)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 28, bottom: 28),
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
            Container(
              margin: const EdgeInsets.only(left: 28, right: 210),
              height: 30,
              width: 124,
              child: Text(
                "Available Promo",
                style: TextStyle(
                    fontFamily: "AirbnbCereal_W_Md",
                    fontSize: 16,
                    color: notifire.textshscreenprimerycolor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 80,
              width: 319,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: notifire.topscreenprimerycolor, width: 1)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    height: 30,
                    width: 319,
                    child: Text(
                      "Crazy Weekend Sale",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Md",
                          color: notifire.textshscreenprimerycolor,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 279,
                    child: Text(
                      "Special offer up to 50% off.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "AirbnbCereal_W_Bk",
                          color: Color(0xff808080)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 80,
              width: 319,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: notifire.topscreenprimerycolor, width: 1)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    height: 30,
                    width: 319,
                    child: Text(
                      "Black Friday Promo",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Md",
                          color: notifire.textshscreenprimerycolor,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 279,
                    child: Text(
                      "25% off for all product.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "AirbnbCereal_W_Bk",
                          color: Color(0xff808080)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
