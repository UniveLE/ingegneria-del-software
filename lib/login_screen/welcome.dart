// ignore_for_file: file_names
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/create_easy.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  // TextEditingController Phonenumber = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // late SharedPreferences logindata;
  // late bool newuser;
  // var output = "";

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // if (newuser == false) {
      //   Navigator.pushReplacement(
      //       context, new MaterialPageRoute(builder: (context) => home()));
      // }
      // if (newuser == true) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => welcome(),
      //       ));
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const Welcome();
        },
      ));
    });
    //check_if_already_login();
  }

  // void check_if_already_login() async {
  //   logindata = await SharedPreferences.getInstance();
  //   newuser = (logindata.getBool('login') ?? true);
  //   print(newuser);
  //
  //   }
  //
  //
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   passwordController.dispose();
  //   Phonenumber.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: notifire.spleshscreenprimerycolor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.only(top: 160, left: 50, right: 50),
            height: 325,
            width: 305,
            child: Image.asset("assets/gogrowsery.png"),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50),
            //     margin: EdgeInsets.only(top: 350),
            child: const Text(
              "MyFoodTracker",
              style: TextStyle(
                  fontFamily: "AirbnbCereal_W_Bd",
                  fontSize: 35,
                  color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  // loginapi() {
  //   var data = {
  //     "mobile": Phonenumber.text.toString(),
  //     "password": passwordController.text.toString()
  //   };
  //   // ApiWrapper.dataPost("rider_login.php", data);
  //   ApiWrapper.dataPost(AppUrl.login, data).then((val) {
  //     if ((val != null) && (val.isNotEmpty)) {
  //       // print(val);
  //       if ((val['ResponseCode'] == "200") && (val['Result'] == "true")) {
  //         // save("Firstuser", true);
  //         setState(() {
  //           save("user", val["user"]);
  //           print("result${getData.read("user")}");
  //           print("result${getData.read("partnerdata")}");
  //           ApiWrapper.showToastMessage(val["ResponseMsg"]);
  //         });
  //         if (Phonenumber != '' && passwordController != '') {
  //           print('Successfull');
  //           logindata.setBool('login', false);
  //           logindata.setString('mobile', passwordController.text);
  //           Navigator.push(
  //               context, MaterialPageRoute(builder: (context) => home()));
  //         }
  //       } else {
  //         ApiWrapper.showToastMessage(val["ResponseMsg"]);
  //       }
  //     }
  //   });
  // }
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
        backgroundColor: notifire.spleshscreenprimerycolor,

        //  backgroundColor: Colors.white,
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                exit(0);
              },
              child: const SizedBox(
                height: 80,
              ),
            ),
            SizedBox(
              height: 313,
              width: 333,
              child: Image.asset(
                "assets/gogrowsery.png",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 100, right: 100),
                  height: 25,
                  width: 150,
                  child: Center(
                      child: Text("Benvenutæ",
                          style: TextStyle(
                              fontSize: 20,
                              color: notifire.textshscreenprimerycolor,
                              fontFamily: "AirbnbCereal_W_Bd"))),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 70, right: 60),
                  height: 50,
                  width: 270,
                  child: const Center(
                      child: Text("MyFoodTracker",
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xff00AB67),
                              fontFamily: "AirbnbCereal_W_Bd"))),
                )
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            const Column(
              children: [
                SizedBox(
                  height: 30,
                  width: 350,
                  //color: Colors.green,
                  child: Center(
                    child: Text(
                      "Gestisci la tua credenza in modo ",
                      style: TextStyle(
                          fontFamily: "AirbnbCereal_W_Bk",
                          color: Color(0xff808080),
                          fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
            const Column(
              children: [
                SizedBox(
                  height: 30,
                  width: 300,
                  //color: Colors.green,
                  child: Center(
                    child: Text("semplice e dinamico.",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff808080),
                            fontFamily: "AirbnbCereal_W_Bk")),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Createeasy();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 45,
                    width: 280,
                    decoration: BoxDecoration(
                        color: const Color(0xff00AB67),
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "Inizia",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "AirbnbCereal_W_Bd"),
                    )),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
