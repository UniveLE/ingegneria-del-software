// // // ignore_for_file: file_names
// // import 'package:flutter/material.dart';
// // import 'package:myfoodtracker/account/account.dart';
// // import 'package:myfoodtracker/cart/cart.dart';
// // import 'package:myfoodtracker/home_page/home.dart';
// // import 'package:myfoodtracker/order_/order.dart';
// // import 'package:myfoodtracker/theme/theme_manager.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // int selectedIndex = 0;
// // class Bottombar extends StatefulWidget {
// //   const Bottombar({Key? key}) : super(key: key);
// //   @override
// //   _BottombarState createState() => _BottombarState();
// // }
// // class _BottombarState extends State<Bottombar> with TickerProviderStateMixin{
// //   late TabController tabController;
// //   @override
// //   void initState() {
// //     super.initState();
// //     tabController = TabController(length: 4, vsync: this);
// //   }
// //   late Colornotifire notifire;
// //   getdarkmodepreviousstate() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     bool? previusstate = prefs.getBool("setIsDark");
// //     if (previusstate == null) {
// //       notifire.setlsDark = false;
// //     } else {
// //       notifire.setlsDark = previusstate;
// //     }
// //   }
// //   List<Widget> myChilders = const [
// //     home(),
// //     order(),
// //     cart(),
// //     account(),
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     notifire = Provider.of<Colornotifire>(context, listen: true);
// //     return
// //        WillPopScope(
// //        // onWillPop: _handleWillPop,
// //         onWillPop: () async => false,
// //     child:
// //       Scaffold(
// //        // backgroundColor: Colors.black,
// //         resizeToAvoidBottomInset: false,
// //
// //         bottomNavigationBar: SizedBox(
// //           height: 70,
// //           child: BottomNavigationBar(
// //             type: BottomNavigationBarType.fixed,
// //            unselectedItemColor: Colors.black,
// //             backgroundColor: Colors.black,
// //            // backgroundColor: Colors.white,
// //             elevation: 0,
// //             selectedLabelStyle: TextStyle(
// //                 fontFamily: 'Gilroy Bold',
// //                 fontWeight: FontWeight.bold,
// //                // color: Colors.amber,
// //                 fontSize: 12),
// //            // fixedColor: Color(0xff00AB67),
// //             unselectedLabelStyle: TextStyle(
// //               fontFamily: 'Gilroy Medium',
// //              // color: Colors.amber,
// //             ),
// //             currentIndex: selectedIndex,
// //             showSelectedLabels: true,
// //             showUnselectedLabels: true,
// //             items: [
// //               BottomNavigationBarItem(
// //                   icon: Image.asset("assets/logo/home1.png",
// //                       color: selectedIndex == 0 ? Color(0xff00AB67) : notifire.textshscreenprimerycolor,
// //                       height: Get.height / 37),
// //                   label: 'Home'),
// //               // BottomNavigationBarItem(
// //               //     icon: Image.asset("assets/Document.png",
// //               //         color: selectedIndex == 1 ? Darkblue : greycolor,
// //               //         height: Get.height / 36),
// //               //     label: 'Services'),
// //               BottomNavigationBarItem(
// //                   icon: Image.asset("assets/logo/order.png",
// //                       color: selectedIndex == 1 ? Color(0xff00AB67) : notifire.textshscreenprimerycolor,
// //                       height: Get.height / 37),
// //                   label: 'Order'),
// //               BottomNavigationBarItem(
// //                 icon: Image.asset( "assets/logo/cart.png",
// //                     color: selectedIndex == 2 ? Color(0xff00AB67) : notifire.textshscreenprimerycolor,
// //                     height: Get.height / 37),
// //                 label: 'Cart',
// //               ),
// //               BottomNavigationBarItem(
// //                 icon:// Padding(
// //                  // padding: const EdgeInsets.only(left: 20),
// //                   //child:
// //                   Image.asset( "assets/logo/account1.png",
// //                       color: selectedIndex == 3 ? Color(0xff00AB67) :notifire.textshscreenprimerycolor,
// //                       height: Get.height / 37),
// //                 //),
// //                 label: 'Account',
// //               ),
// //             ],
// //             onTap: (index) {
// //               setState(() {});
// //               selectedIndex = index;
// //             },
// //           ),
// //         ),
// //         body: myChilders[selectedIndex],
// //       ));
// //   }
// // }
// // import 'package:dm/hoteldetailage.dart';
// // ignore_for_file: unused_field, library_private_types_in_public_api, camel_case_types
//
// import 'package:flutter/material.dart';
// import 'package:myfoodtracker/account/account.dart';
// import 'package:myfoodtracker/cart/cart.dart';
// import 'package:myfoodtracker/order_/order.dart';
// import 'package:myfoodtracker/theme/colors.dart';
// import 'package:myfoodtracker/theme/theme_manager.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home_page/home.dart';
//
// int selectedIndex = 0;
//
// class Bottombar extends StatefulWidget {
//   const Bottombar({Key? key}) : super(key: key);
//
//   @override
//   _BottombarState createState() => _BottombarState();
// }
//
// class _BottombarState extends State<Bottombar> {
//   late int _lastTimeBackButtonWasTapped;
//   static const exitTimeInMillis = 2000;
//
//   List<Widget> myChilders = const [
//     home(),
//     order(),
//     cart(),
//     account(),
//   ];
//
//   @override
//   void initState() {
//     getdarkmodepreviousstate();
//     super.initState();
//   }
//
//   late Colornotifire notifire;
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
//
//   @override
//   Widget build(BuildContext context) {
//     notifire = Provider.of<Colornotifire>(context, listen: true);
//     return
//       // WillPopScope(
//       // // onWillPop: _handleWillPop,
//       // child:
//       Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           unselectedItemColor: notifire.blackwhite,
//           backgroundColor: notifire.blackwhite,
//           elevation: 0,
//           selectedLabelStyle: const TextStyle(
//               fontFamily: 'Gilroy Bold', fontWeight: FontWeight.bold),
//           fixedColor: notifire.blackwhite,
//           unselectedLabelStyle: const TextStyle(fontFamily: 'Gilroy Medium'),
//           currentIndex: selectedIndex,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           items: [
//             BottomNavigationBarItem(
//                 icon: Image.asset("assets/images/homeicon.png",
//                     color: selectedIndex == 0 ? PrimeryColor : Colors.grey,
//                     height: MediaQuery
//                         .of(context)
//                         .size
//                         .height / 35),
//                 label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Image.asset("assets/images/search.png",
//                     color: selectedIndex == 1 ? Colors.green : Colors.grey,
//                     height: MediaQuery
//                         .of(context)
//                         .size
//                         .height / 35),
//                 label: 'Search'),
//             BottomNavigationBarItem(
//                 icon: Image.asset("assets/images/message.png",
//                     color: selectedIndex == 2 ? Colors.green : Colors.grey,
//                     height: MediaQuery
//                         .of(context)
//                         .size
//                         .height / 35),
//                 label: 'Message'),
//             BottomNavigationBarItem(
//               icon: Image.asset("assets/images/profile.png",
//                   color: selectedIndex == 3 ? Colors.green : Colors.grey,
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height / 35),
//               label: 'Profile',
//             ),
//           ],
//           onTap: (index) {
//             setState(() {});
//             selectedIndex = index;
//           },
//         ),
//         body: myChilders[selectedIndex],
//       );
//   }
// }