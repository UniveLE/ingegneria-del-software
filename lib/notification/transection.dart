// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Transection extends StatefulWidget {
  const Transection({Key? key}) : super(key: key);

  @override
  State<Transection> createState() => _TransectionState();
}

class _TransectionState extends State<Transection> {
  late Colornotifire notifire;
  bool all = false;
  bool you = true;
  bool artichoke = true;
  bool barcoli = true;
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
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        all = !true;
                        you = !false;
                        artichoke = !false;
                        barcoli = !false;
                        setState(() {});
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 8, bottom: 8, left: 28),
                        height: 40,
                        width: 55,
                        decoration: BoxDecoration(
                            color: all
                                ? notifire.spleshscreenprimerycolor
                                : Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: all ? Colors.black12 : Colors.green,
                                width: 1)),
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                color: all
                                    ? notifire.mintextscreenprimerycolor
                                    : Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        all = !false;
                        you = !true;
                        artichoke = !false;
                        barcoli = !false;
                        setState(() {});
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 8, bottom: 8, left: 16),
                        height: 40,
                        width: 107,
                        decoration: BoxDecoration(
                            color: you
                                ? notifire.spleshscreenprimerycolor
                                : Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: you ? Colors.black12 : Colors.green,
                                width: 1)),
                        child: Center(
                          child: Text(
                            "Informastion",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                color: you
                                    ? notifire.mintextscreenprimerycolor
                                    : Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        all = !false;
                        you = !false;
                        artichoke = !true;
                        barcoli = !false;
                        setState(() {});
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 8, bottom: 8, left: 16),
                        height: 40,
                        width: 77,
                        decoration: BoxDecoration(
                            color: artichoke
                                ? notifire.spleshscreenprimerycolor
                                : Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color:
                                    artichoke ? Colors.black12 : Colors.green,
                                width: 1)),
                        child: Center(
                          child: Text(
                            "Promo",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                color: artichoke
                                    ? notifire.mintextscreenprimerycolor
                                    : Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        all = !false;
                        you = !false;
                        artichoke = !false;
                        barcoli = !true;
                        setState(() {});
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 8, bottom: 8, left: 16),
                        height: 40,
                        width: 107,
                        decoration: BoxDecoration(
                            color: barcoli
                                ? notifire.spleshscreenprimerycolor
                                : Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: barcoli ? Colors.black12 : Colors.green,
                                width: 1)),
                        child: Center(
                          child: Text(
                            "Activity",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                color: barcoli
                                    ? notifire.mintextscreenprimerycolor
                                    : Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 28, left: 28),
                      height: 15,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff00AB67).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "TRANSACTION",
                          style:
                              TextStyle(fontSize: 8, color: Color(0xff00AB67)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 13, top: 28),
                      height: 20,
                      width: 70,
                      child: Center(
                        child: Text(
                          "An hour ago",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Bd.",
                              color: notifire.mintextscreenprimerycolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 150, top: 28, right: 20),
                      height: 12,
                      width: 12,
                      child: Image.asset("assets/logo/round.png"),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 28, right: 28),
                  height: 30,
                  width: 319,
                  color: notifire.spleshscreenprimerycolor,
                  child: Text(
                    "Rate your order experience",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "AirbnbCereal_W_Bd",
                        color: notifire.textshscreenprimerycolor),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 28, right: 28),
                  height: 40,
                  width: 319,
                  color: notifire.spleshscreenprimerycolor,
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Md",
                          fontSize: 12,
                          color: notifire.mintextscreenprimerycolor)),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 28),
              height: 2,
              color: notifire.topscreenprimerycolor,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 28, left: 28),
                      height: 15,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff00AB67).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "TRANSACTION",
                          style:
                              TextStyle(fontSize: 8, color: Color(0xff00AB67)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 13, top: 28),
                      height: 20,
                      width: 90,
                      child: Center(
                        child: Text(
                          "Today, 10:00 AM",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Bd.",
                              color: notifire.mintextscreenprimerycolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 28, right: 28),
                  height: 30,
                  width: 319,
                  color: notifire.spleshscreenprimerycolor,
                  child: Text(
                    "You got \$10 cashback from your last order",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "AirbnbCereal_W_Bd",
                        color: notifire.textshscreenprimerycolor),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 28, right: 28),
                  height: 40,
                  width: 319,
                  color: notifire.spleshscreenprimerycolor,
                  child: Text(
                      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Md",
                          fontSize: 12,
                          color: notifire.mintextscreenprimerycolor)),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 28),
              height: 2,
              color: notifire.topscreenprimerycolor,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 28, left: 28),
                      height: 15,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff00AB67).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "TRANSACTION",
                          style:
                              TextStyle(fontSize: 8, color: Color(0xff00AB67)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 13, top: 28),
                      height: 20,
                      width: 120,
                      child: Center(
                        child: Text(
                          "Yesterday, 9:23 PM",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Bd.",
                              color: notifire.mintextscreenprimerycolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 28, right: 28),
                  height: 40,
                  width: 319,
                  color: notifire.spleshscreenprimerycolor,
                  child: Text(
                    "Order completed #PG080521",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "AirbnbCereal_W_Bd",
                        color: notifire.textshscreenprimerycolor),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 28, right: 28),
                  height: 40,
                  width: 319,
                  color: notifire.spleshscreenprimerycolor,
                  child: Text(
                      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Md",
                          fontSize: 12,
                          color: notifire.mintextscreenprimerycolor)),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 28, left: 28),
                      height: 15,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff00AB67).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "TRANSACTION",
                          style:
                              TextStyle(fontSize: 8, color: Color(0xff00AB67)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 13, top: 28),
                      height: 20,
                      width: 120,
                      child: Center(
                        child: Text(
                          "Aug 03, 2021",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Bd.",
                              color: notifire.mintextscreenprimerycolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 28, right: 28),
                  height: 40,
                  width: 319,
                  color: notifire.spleshscreenprimerycolor,
                  child: Text(
                    "Waiting for payment #PG080521",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "AirbnbCereal_W_Bd",
                        color: notifire.textshscreenprimerycolor),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 28, right: 28),
                  height: 50,
                  width: 319,
                  color: notifire.spleshscreenprimerycolor,
                  child: Text(
                      "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Md",
                          fontSize: 12,
                          color: notifire.mintextscreenprimerycolor)),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "Mark all as read",
                  style: TextStyle(
                      fontFamily: "AirbnbCereal_W_Md",
                      fontSize: 12,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
