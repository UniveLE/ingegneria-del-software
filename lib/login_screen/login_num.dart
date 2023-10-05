// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/login.dart';
import 'package:myfoodtracker/login_screen/otp.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginnums extends StatefulWidget {
  const Loginnums({Key? key}) : super(key: key);

  @override
  State<Loginnums> createState() => _LoginnumsState();
}

class _LoginnumsState extends State<Loginnums> {
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
        // toolbarHeight: 80,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, MaterialPageRoute(
              builder: (context) {
                return const Login();
              },
            ));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 8, left: 20, bottom: 8),
            height: 15,
            width: 12,
            child: Icon(
              Icons.arrow_back,
              color: notifire.iconscreenprimerycolor,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 260),
              child: Text(
                "Login",
                style: TextStyle(
                    fontFamily: "AirbnbCereal_W_Bd",
                    color: notifire.textshscreenprimerycolor,
                    fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.only(right: 28, left: 28),
              height: 60,
              width: 319,
              child: Text(
                "join to grocery for lorem dolor sit amet consectetur adisipisicing elit.",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "AirbnbCereal_W_Bd",
                    color: notifire.mintextscreenprimerycolor),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(right: 120),
              width: 200,
              child: Text(
                "Phone Number",
                style: TextStyle(
                    fontSize: 12,
                    color: notifire.mintextscreenprimerycolor,
                    fontFamily: "AirbnbCereal_W_Bd"),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                height: 60,
                width: 319,
                decoration: BoxDecoration(
                  color: notifire.topscreenprimerycolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text("")),
                    Center(
                      child: Container(
                          margin: const EdgeInsets.only(left: 15),
                          height: 23,
                          width: 22,
                          //   color: Colors.blue,
                          child: Center(
                            child: Image.asset(
                              "assets/logo/num.png",
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 48,
                      width: 230,
                      child: TextField(
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                                color: notifire.mintextscreenprimerycolor,
                                fontSize: 14)
                            //  labelText: "user name"
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Otp();
                  },
                ));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 60,
                width: 319,
                decoration: BoxDecoration(
                    color: const Color(0xff00AB67),
                    // color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: "AirbnbCereal_W_Bd"),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
