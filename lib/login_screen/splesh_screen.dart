// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:myfoodtracker/welcome.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'theme/theme_manager.dart';
//
// class splesh_screen extends StatefulWidget {
//   const splesh_screen({Key? key}) : super(key: key);
//
//   @override
//   State<splesh_screen> createState() => _splesh_screenState();
// }
//
// class _splesh_screenState extends State<splesh_screen> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//   bool status=false;
//   late Colornotifire notifire;
//
//
//   getdarkmodepreviousstate() async {
//     final prefs = await SharedPreferences.getInstance();
//     bool? previusstate = prefs.getBool("setIsDark");
//     if (previusstate == null) {
//       notifire.setlsDark = false;
//     } else {
//       notifire.setlsDark = previusstate;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     notifire = Provider.of<Colornotifire>(context, listen: true);
//     return Scaffold(
//       backgroundColor: notifire.spleshscreenprimerycolor,
//       body:
//                 Center(
//                   child: Container(
//                //     margin: EdgeInsets.only(top: 350),
//                     child: Text(
//                       "grocery",
//                       style: TextStyle(
//                           fontFamily: "AirbnbCereal_W_Bd",
//                           fontSize: 40,
//                           color: Colors.green),
//                     ),
//                   ),
//                 ),
//     );
//   }
// }
