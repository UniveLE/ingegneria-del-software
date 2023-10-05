// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Promoditail extends StatefulWidget {
  const Promoditail({Key? key}) : super(key: key);

  @override
  State<Promoditail> createState() => _PromoditailState();
}

class _PromoditailState extends State<Promoditail> {
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
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 28, right: 28, bottom: 15),
        height: 60,
        width: 300,
        decoration: BoxDecoration(
            color: const Color(0xff00AB67),
            borderRadius: BorderRadius.circular(20)),
        child: const Center(
            child: Text(
          "Apply Code",
          style: TextStyle(
              fontSize: 12,
              fontFamily: "AirbnbCereal_W_Bk",
              color: Colors.white),
        )),
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
                  left: 90, right: 140, top: 8, bottom: 10),
              child: Center(
                child: Text(
                  "Promo Detail",
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 22, left: 28, right: 28),
            height: 150,
            width: 319,
            child: Image.asset("assets/Coupon.png"),
          ),
          Container(
            margin: const EdgeInsets.only(left: 28, right: 25, top: 20),
            height: 50,
            width: 320,
            decoration: BoxDecoration(
                color: const Color(0xff00AB67).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                  height: 20,
                  width: 106,
                  child: const Text(
                    "CODE: DISC10OFF",
                    style: TextStyle(
                        fontFamily: "AirbnbCereal_W_Bk",
                        fontSize: 12,
                        color: Color(0xff00AB67)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10, left: 110),
                  height: 30,
                  width: 59,
                  decoration: BoxDecoration(
                      color: const Color(0xff00AB67),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    "Apply",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "AirbnbCereal_W_Bk",
                        color: Colors.white),
                  )),
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 28),
                height: 20,
                width: 81,
                child: Text(
                  "Available until:",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "AirbnbCereal_W_Bk",
                      color: notifire.textshscreenprimerycolor),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 150, top: 20),
                height: 20,
                width: 99,
                child: Text(
                  "October 31, 2021",
                  style: TextStyle(
                      fontFamily: "AirbnbCereal_W_Md",
                      fontSize: 12,
                      color: notifire.textshscreenprimerycolor),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 28, bottom: 28),
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: notifire.topscreenprimerycolor,
          ),
          Container(
            margin: const EdgeInsets.only(left: 28, right: 190),
            child: Text(
              "Terms & Condition",
              style: TextStyle(
                  fontFamily: "AirbnbCereal_W_Bd",
                  fontSize: 16,
                  color: notifire.textshscreenprimerycolor),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, left: 28, right: 28),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AirbnbCereal_W_Bk",
                  color: notifire.mintextscreenprimerycolor),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 28, right: 28),
            child: Text(
              " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat.",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AirbnbCereal_W_Bk",
                  color: notifire.mintextscreenprimerycolor),
            ),
          ),
        ],
      ),
    );
  }
}
