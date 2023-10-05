// ignore_for_file: file_names
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
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
        child: Column(children: [
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
                              color:
                                  all ? const Color(0xffCCCCCC) : Colors.green,
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
                              color: artichoke ? Colors.black12 : Colors.green,
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
                    width: 41,
                    decoration: BoxDecoration(
                        color: const Color(0xff00AB67).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "PROMO",
                        style: TextStyle(fontSize: 8, color: Color(0xff00AB67)),
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
                        const EdgeInsets.only(left: 168, top: 28, right: 20),
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
                  "Congrats! you got 10% off for all product",
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
                    "Wuzzah, have a nice hopping experince! Please check the expired date of the voucher.",
                    style: TextStyle(
                        fontFamily: "AirbnbCereal_W_Md",
                        fontSize: 12,
                        color: notifire.mintextscreenprimerycolor)),
              )
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 28, right: 28),
                height: 150,
                width: 319,
                child: Image.asset("assets/Coupon.png"),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            height: 2,
            color: notifire.topscreenprimerycolor,
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 13, left: 28),
                    height: 15,
                    width: 60,
                    decoration: BoxDecoration(
                        color: const Color(0xff00AB67).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "INFORMATION",
                        style: TextStyle(fontSize: 8, color: Color(0xff00AB67)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 13, top: 13),
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
                  "Your favorite items is available",
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
                    "Hey, special for you! Your favorite items is back."
                    "Check it out before runs out!",
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
                    margin: const EdgeInsets.only(top: 20, left: 28),
                    height: 67,
                    width: 67,
                    child: Image.asset("assets/fruit_1.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 16),
                    height: 67,
                    width: 67,
                    child: Image.asset("assets/Fruit_2.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 16),
                    height: 67,
                    width: 67,
                    child: Image.asset("assets/fruit_3.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 16),
                    height: 67,
                    width: 67,
                    child: Image.asset("assets/fruit_4.png"),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            height: 2,
            color: notifire.topscreenprimerycolor,
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 13, left: 28),
                    height: 15,
                    width: 45,
                    decoration: BoxDecoration(
                        color: const Color(0xff00AB67).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "EVENT",
                        style: TextStyle(fontSize: 8, color: Color(0xff00AB67)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 13, top: 13),
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
                  "Get 20% off your first order. This offer ends in a week, let’s get this!",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "AirbnbCereal_W_Bd",
                      color: notifire.textshscreenprimerycolor),
                ),
              )
            ],
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 20, left: 28, right: 28, bottom: 20),
            height: 40,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: notifire.topscreenprimerycolor)),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 7),
                  height: 20,
                  width: 210,
                  child: Text("PROMOCODE",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "AirbnbCereal_W_Md",
                          color: notifire.mintextscreenprimerycolor)),
                ),
                IconButton(
                    onPressed: () {
                      FlutterClipboard.copy('PROMOCODE').then((value) =>
                          Fluttertoast.showToast(
                              msg: "copied",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0));
                    },
                    icon: Icon(
                      Icons.copy,
                      color: notifire.mintextscreenprimerycolor,
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
