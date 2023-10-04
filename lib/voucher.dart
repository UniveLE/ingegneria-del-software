// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Voucher extends StatefulWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
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

  bool all = false;
  bool you = true;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.spleshscreenprimerycolor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: notifire.spleshscreenprimerycolor,
        leading: BackButton(
          color: notifire.textshscreenprimerycolor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            InkWell(
              onTap: () {
                all = !true;
                you = !false;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 80,
                width: 319,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: all ? Colors.black12 : Colors.green, width: 1)),
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                    SizedBox(
                      height: 20,
                      width: 279,
                      child: Row(
                        children: const [
                          Text(
                            "Special offer up to 50% off.",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "AirbnbCereal_W_Bk",
                                color: Color(0xff808080)),
                          ),
                          Text(
                            " See Detail",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "AirbnbCereal_W_Bk",
                                color: Color(0xff00AB67)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                all = !false;
                you = !true;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 80,
                width: 319,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: you ? Colors.black12 : Colors.green, width: 1)),
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
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
            ),
          ],
        ),
      ),
    );
  }
}
