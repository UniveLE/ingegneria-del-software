// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
        leading: BackButton(
          color: notifire.textshscreenprimerycolor,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: notifire.spleshscreenprimerycolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: notifire.textshscreenprimerycolor),
            ),
          ],
        ),
      ),
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 250),
              child: Text(
                "Full Name",
                style: TextStyle(
                    fontSize: 12,
                    color: notifire.mintextscreenprimerycolor,
                    fontFamily: "AirbnbCereal_W_Bd"),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
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
                      child: const Icon(Icons.person_outline_rounded,
                          color: Color(0xffCCCCCC)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 48,
                      width: 230,
                      child: TextField(
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Input your name",
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
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 120),
              width: 200,
              child: Text(
                "Email Address",
                style: TextStyle(
                    fontSize: 12,
                    color: notifire.mintextscreenprimerycolor,
                    fontFamily: "AirbnbCereal_W_Bd"),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 60,
                width: 319,
                decoration: BoxDecoration(
                  color: notifire.topscreenprimerycolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Center(
                      child: Container(
                          margin: const EdgeInsets.only(left: 15),
                          height: 20,
                          width: 22,
                          //   color: Colors.blue,
                          child: Center(
                            child: Image.asset(
                              "assets/logo/profi.png",
                              color: const Color(0xffCCCCCC),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    SizedBox(
                      height: 48,
                      width: 230,
                      child: TextField(
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Input your email",
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
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 120),
              width: 200,
              child: Text(
                "Feedback",
                style: TextStyle(
                    fontSize: 12,
                    color: notifire.mintextscreenprimerycolor,
                    fontFamily: "AirbnbCereal_W_Bd"),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                // padding: EdgeInsets.only(bottom: 100),

                height: 150,
                width: 319,
                decoration: BoxDecoration(
                  color: notifire.topscreenprimerycolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    // Center(
                    //   child: Container(
                    //       margin: EdgeInsets.only(left: 15),
                    //       height: 20,
                    //       width: 22,
                    //       //   color: Colors.blue,
                    //       child:
                    //       Center(
                    //         child: Image.asset("assets/logo/profi.png", color: Color(0xffCCCCCC),
                    //         ),
                    //       )
                    //   ),
                    // ),
                    const SizedBox(
                      width: 14,
                    ),
                    SizedBox(
                      height: 100,
                      width: 230,
                      child: TextField(
                        maxLines: 6,
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Leave your feeedback...",
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
              height: 220,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Bottombar();
                  },
                ));
              },
              child: Container(
                // margin: EdgeInsets.only(top: 90),
                height: 60,
                width: 319,
                decoration: BoxDecoration(
                    color: const Color(0xff00AB67),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    "Send",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AirbnbCereal_W_Bk",
                        fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
