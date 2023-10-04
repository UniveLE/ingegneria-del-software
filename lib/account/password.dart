// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
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

  bool hiddenpassword = true;
  bool hiddenpasswor = true;
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
            const SizedBox(
              width: 10,
            ),
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
                  left: 76, right: 120, top: 8, bottom: 10),
              child: Center(
                child: Text(
                  "Change Password",
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
              margin: const EdgeInsets.only(left: 28, right: 28, top: 16),
              height: 90,
              width: 319,
              child: Text(
                "Password Must contain at least 8 characters. With uppercase, lowercase, and special characters.",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "AirbnbCereal_W_Md",
                    color: notifire.mintextscreenprimerycolor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 120, top: 28),
              width: 200,
              child: Text(
                "Old Password",
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
                        child: const Icon(
                          Icons.lock_outline,
                          color: Color(0xffCCCCCC),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 48,
                      width: 250,
                      child: TextField(
                        obscureText: hiddenpassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              padding: const EdgeInsets.only(left: 70),
                              onPressed: () {
                                setState(() {
                                  hiddenpassword = !hiddenpassword;
                                });
                              },
                              icon: hiddenpassword
                                  ? const Icon(
                                      Icons.visibility_off_outlined,
                                      color: Color(0xffCCCCCC),
                                    )
                                  : Image.asset("assets/logo/pass.png"),
                            ),
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "password",
                            hintStyle: TextStyle(
                                color: notifire.mintextscreenprimerycolor,
                                fontSize: 14)
                            //  labelText: "user name"
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 120, top: 28),
              width: 200,
              child: Text(
                "New Password",
                style: TextStyle(
                    fontSize: 12,
                    color: notifire.mintextscreenprimerycolor,
                    fontFamily: "AirbnbCereal_W_Bd"),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 285),
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
                        child: const Icon(
                          Icons.lock_outline,
                          color: Color(0xffCCCCCC),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 48,
                      width: 250,
                      child: TextField(
                        obscureText: hiddenpasswor,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              padding: const EdgeInsets.only(left: 90),
                              onPressed: () {
                                setState(() {
                                  hiddenpasswor = !hiddenpasswor;
                                });
                              },
                              icon: hiddenpasswor
                                  ? const Icon(
                                      Icons.visibility_off_outlined,
                                      color: Color(0xffCCCCCC),
                                    )
                                  : Image.asset("assets/logo/pass.png"),
                            ),
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "password",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: notifire.mintextscreenprimerycolor)
                            //  labelText: "user name"
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Bottombar();
                  },
                ));
              },
              child: Container(
                //  margin: EdgeInsets.only(top: 285),
                height: 60,
                width: 319,
                decoration: BoxDecoration(
                    color: const Color(0xff00AB67),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AirbnbCereal_W_Bk",
                        fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
