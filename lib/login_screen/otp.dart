// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/login_screen/login_num.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final pinController = TextEditingController();
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
                return const Loginnums();
              },
            ));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 8, left: 15, bottom: 8),
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
              margin: const EdgeInsets.only(left: 5, right: 140),
              child: Text(
                "Verify Account",
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
                "Verify your account by entering verification code we sent to 903-939-9429",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "AirbnbCereal_W_Bd",
                    color: notifire.mintextscreenprimerycolor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 15),
              child: Pinput(
                length: 4,
                controller: pinController,

                // submittedPinTheme: ,
                // onSubmitted: ,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Gilroy Bold"),
                  decoration: BoxDecoration(
                    color: notifire.topscreenprimerycolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                errorText: 'Wrong otp',
              ),
            ),
            // Column(
            //   children: [
            //     Container(
            //       height: 80,
            //       width: 300,
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 60,
            //             width: 60,
            //             decoration: BoxDecoration(
            //                 // color: notifire.otpscreenprimerycolor,
            //                 color: notifire.topscreenprimerycolor,
            //                 borderRadius: BorderRadius.circular(10),
            //                ),
            //             child: TextField(
            //               decoration: InputDecoration(
            //                 disabledBorder: InputBorder.none,
            //                 focusedBorder: InputBorder.none,
            //                 enabledBorder: InputBorder.none,
            //                 //   hintText: "Email or Phone Number",
            //                 //  labelText: "user name"
            //               ),
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.only(right: 15, left: 15),
            //             height: 60,
            //             width: 60,
            //             decoration: BoxDecoration(
            //                 //   color: notifire.otpscreenprimerycolor,
            //                 color: notifire.topscreenprimerycolor,
            //                 borderRadius: BorderRadius.circular(10),
            //                 ),
            //             child: TextField(
            //               decoration: InputDecoration(
            //                 disabledBorder: InputBorder.none,
            //                 focusedBorder: InputBorder.none,
            //                 enabledBorder: InputBorder.none,
            //                 //   hintText: "Email or Phone Number",
            //                 //  labelText: "user name"
            //               ),
            //             ),
            //           ),
            //           Container(
            //             height: 60,
            //             width: 60,
            //             decoration: BoxDecoration(
            //                 //color: notifire.otpscreenprimerycolor,
            //                 color: notifire.topscreenprimerycolor,
            //                 borderRadius: BorderRadius.circular(10),),
            //             child:Pinput(length: 4,)
            //             ),
            //           Container(
            //             margin: EdgeInsets.only(left: 15),
            //             height: 60,
            //             width: 60,
            //             decoration: BoxDecoration(
            //                 //color:notifire.otpscreenprimerycolor,
            //                 color: notifire.topscreenprimerycolor,
            //                 borderRadius: BorderRadius.circular(10),
            //                     ),
            //             child: TextField(
            //               decoration: InputDecoration(
            //                 disabledBorder: InputBorder.none,
            //                 focusedBorder: InputBorder.none,
            //                 enabledBorder: InputBorder.none,
            //                 //   hintText: "Email or Phone Number",
            //                 //  labelText: "user name"
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 60,
              width: 319,
              child: const Center(
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: "AirbnbCereal_W_Bk",
                      fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              height: 220,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 800,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 170),
                                height: 640,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: notifire.spleshscreenprimerycolor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(28),
                                        topRight: Radius.circular(28))),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      height: 5,
                                      width: 50,
                                      child: Image.asset("assets/Line.png"),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 52, left: 28, right: 190),
                                      child: Text(
                                        "Terms & Condition",
                                        style: TextStyle(
                                            fontFamily: "AirbnbCereal_W_Bd",
                                            fontSize: 16,
                                            color: notifire
                                                .textshscreenprimerycolor),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 25, left: 28, right: 28),
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do elusmod tempor incididunt ut labore et dolore magna aliqua. ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "AirbnbCereal_W_Bk",
                                            color: notifire
                                                .mintextscreenprimerycolor),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 25, left: 28, right: 28),
                                      child: Text(
                                        "Vitae et leo duis ut. fermentum dui faucibus in ornare quam viverra. laoreet non curabitur  gravids arcu ac tortor. viverra adipiscing at in tellus integer feugiat scelerisque varius. ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "AirbnbCereal_W_Bk",
                                            color: notifire
                                                .mintextscreenprimerycolor),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 25, left: 28, right: 28),
                                      child: Text(
                                        "Ultrices tincidunt arcu non sodales neque sodales ut etiam sit.",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "AirbnbCereal_W_Bk",
                                            color: notifire
                                                .mintextscreenprimerycolor),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 25, left: 28, right: 28),
                                      child: Text(
                                        "Et netus et malesuada fames. Cras sed feils eget velit aliquet sagittis. Eu sem integer vitae justo eget magna. Negue ornare aenean euismod elementum. Adipiscing diam donec adipiscing tristique risus.",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "AirbnbCereal_W_Bk",
                                            color: notifire
                                                .mintextscreenprimerycolor),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const Bottombar();
                                            },
                                          ));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 40, bottom: 15),
                                          height: 60,
                                          width: 319,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff00AB67),
                                              // color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Center(
                                              child: Text(
                                            "Procced",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontFamily:
                                                    "AirbnbCereal_W_Bd"),
                                          )),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
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
            ),
          ],
        ),
      ),
    );
  }
}
