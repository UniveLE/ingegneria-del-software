// ignore_for_file: camel_case_types, use_key_in_widget_constructors, annotate_overrides, prefer_const_literals_to_create_immutables, file_names, unused_element, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/login.dart';
import 'package:myfoodtracker/login_screen/register.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Createeasy extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<Createeasy> {
  // creating all the widget before making our home screeen
  void initState() {
    super.initState();
    _currentPage = 0;
    _slides = [
      Slide("assets/Group1.png", "Easy Shopping",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do elusmod."),
      Slide("assets/Group2.png", "Get Discount & Offer",
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris."),
      Slide("assets/Group3.png", "Free & Quick Delivery",
          "Luis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore."),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

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

  Widget _buildSlide(Slide slide) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              slide.heading,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "AirbnbCereal_W_Md",
                  color: notifire.textshscreenprimerycolor), //heding Text
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              slide.subtext,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: notifire.mintextscreenprimerycolor,
                  fontFamily: "Gilroy Medium"), //subtext
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // ignore: sized_box_for_whitespace
          Padding(
            padding: const EdgeInsets.all(8.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 350, //imagee size
              width: 370,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      slide.image,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 1.9,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
        ],
      ),
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        // ignore: curly_braces_in_flow_control_structures
        row.children.add(const SizedBox(
          width: 10,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 12 : 8,
      height: index == _currentPage ? 12 : 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? Color(0xff00AB67)
              : Color(0xff00AB67).withOpacity(0.2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: _handlingOnPageChanged,
                physics: const BouncingScrollPhysics(),
                children: _buildSlides(),
              ),
              // GestureDetector(
              //   onTap: () {
              //     // Navigator.of(context).push(MaterialPageRoute(
              //     //     builder: (context) => const LoginScreen()));
              //   },
              //   child: Padding(
              //     padding:
              //     const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
              //     child: Align(
              //       alignment: Alignment.topRight,
              //       child: Container(
              //         margin: const EdgeInsets.all(8),
              //         height: 35,
              //         width: 70,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(30),
              //             color: Colors.black38),
              //         child: Center(
              //           child: Text(
              //             "Skip",
              //             style: TextStyle(
              //                 fontSize: 14,
              //                 fontFamily: "Gilroy Bold",
              //                 color: Colors.white),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05, //indicator set screen
                ),
                _currentPage == 2
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Register();
                              },
                            ));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff00AB67),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "Create account",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: "AirbnbCereal_W_Bd"),
                                ),
                              )),
                        ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff00AB67),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "Create account",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: "AirbnbCereal_W_Bd"),
                                ),
                              )),
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ));
                  },
                  child: Text(
                    "Login to Your Account",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "AirbnbCereal_W_Bd",
                        color: notifire.mintextscreenprimerycolor),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Slide {
  String image;
  String heading;
  String subtext;

  Slide(this.image, this.heading, this.subtext);
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myfoodtracker/login.dart';
// import 'package:myfoodtracker/register.dart';
// import 'package:myfoodtracker/theme/theme_manager.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class create_easy extends StatefulWidget {
//   const create_easy({Key? key}) : super(key: key);
//
//   @override
//   State<create_easy> createState() => _create_easyState();
// }
//
// class _create_easyState extends State<create_easy> {
//   bool status = false;
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
//
//     return Scaffold(
//       backgroundColor: notifire.spleshscreenprimerycolor,
//       bottomNavigationBar: Container(
//         height: 180,
//         width: 300,
//         child: Column(
//           children: [
//             InkWell(onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return register();
//               },));
//             },
//               child: Container(
//                 height: 60,
//                 width: 319,
//                 decoration: BoxDecoration(
//                     color: Color(0xff00AB67),
//                     // color: Colors.green,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Center(
//                     child: Text(
//                   "Create account",
//                   style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.white,
//                       fontFamily: "AirbnbCereal_W_Bd"),
//                 )),
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             InkWell(onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return login();
//               },));
//             },child:
//             Container(
//               child: Text("Login to Your Account",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontFamily: "AirbnbCereal_W_Bd",
//                       color: notifire.mintextscreenprimerycolor)),
//             ),
//             )
//           ],
//         ),
//       ),
//
//       //backgroundColor: Colors.white,
//       body: Container(
//         child: PageView.builder(
//           itemBuilder: (context, index) {
//             return PageView(
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 80, right: 50, left: 50),
//                       height: 50,
//                       width: 250,
//                       //color: Colors.green,
//                       child: Center(
//                           child: Text("Easy Shopping",
//                               style: TextStyle(
//                                   fontFamily: "AirbnbCereal_W_Bd",
//                                   color: notifire.textshscreenprimerycolor,
//                                   fontSize: 24))),
//                     ),
//                     SizedBox(
//                       height: 25,
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 350,
//                           //color: Colors.green,
//                           child: Center(
//                             child: Text(
//                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do elusmod. ",
//                               style: TextStyle(
//                                   fontFamily: "AirbnbCereal_W_Bk",
//                                   color: notifire.mintextscreenprimerycolor,
//                                   fontSize: 16),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 300,
//                           //color: Colors.green,
//                           child: Center(
//                             child: Text("adipiscing elit, sed do elusmod.",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: notifire.mintextscreenprimerycolor,
//                                     fontFamily: "AirbnbCereal_W_Bk")),
//                           ),
//                         ),
//                         Container(
//                           height: 297,
//                           width: 268,
//                           child: Image.asset("assets/slide1.png"),
//                         ),
//                         SizedBox(
//                           height: 35,
//                         ),
//                         Container(
//                           height: 8,
//                           width: 46,
//                           child: Image.asset("assets/logo/slide_1.png"),
//                         ),
//                       ],
//                     ),
//                     // SizedBox(height: 10,),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 80, right: 50, left: 50),
//                       height: 50,
//                       width: 250,
//                       //color: Colors.green,
//                       child: Center(
//                           child: Text("Get Discount & Offer Ut adim adminim veniam, quis nostrud",
//                               style: TextStyle(
//                                   fontFamily: "AirbnbCereal_W_Bd",
//                                   color: notifire.textshscreenprimerycolor,
//                                   fontSize: 24))),
//                     ),
//                     SizedBox(
//                       height: 25,
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 350,
//                           //color: Colors.green,
//                           child: Center(
//                             child: Text(
//                               "Ut adim adminim veniam, quis nostrud",
//                               style: TextStyle(
//                                   fontFamily: "AirbnbCereal_W_Bk",
//                                   color: notifire.mintextscreenprimerycolor,
//                                   fontSize: 16),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 300,
//                           //color: Colors.green,
//                           child: Center(
//                             child: Text("exercitation ullamco laboris.",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: notifire.mintextscreenprimerycolor,
//                                     fontFamily: "AirbnbCereal_W_Bk")),
//                           ),
//                         ),
//                         Container(
//                           height: 297,
//                           width: 268,
//                           child: Image.asset("assets/slide2.png"),
//                         ),
//                         SizedBox(
//                           height: 35,
//                         ),
//                         Container(
//                           height: 8,
//                           width: 46,
//                           child: Image.asset("assets/logo/slide_2.png"),
//                         ),
//                       ],
//                     ),
//                     // SizedBox(height: 10,),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 80, right: 50, left: 50),
//                       height: 50,
//                       width: 250,
//                       //color: Colors.green,
//                       child: Center(
//                           child: Text("Free & Quick Delivery",
//                               style: TextStyle(
//                                   fontFamily: "AirbnbCereal_W_Bd",
//                                   color: notifire.textshscreenprimerycolor,
//                                   fontSize: 24))),
//                     ),
//                     SizedBox(
//                       height: 25,
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 350,
//                           //color: Colors.green,
//                           child: Center(
//                             child: Text(
//                               "Luis aute irure dolor in reprehenderit in",
//                               style: TextStyle(
//                                   fontFamily: "AirbnbCereal_W_Bk",
//                                   color: notifire.mintextscreenprimerycolor,
//                                   fontSize: 16),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 300,
//                           //color: Colors.green,
//                           child: Center(
//                             child: Text("voluptate velit esse cillum dolore.",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: notifire.mintextscreenprimerycolor,
//                                     fontFamily: "AirbnbCereal_W_Bk")),
//                           ),
//                         ),
//                         Container(
//                           height: 297,
//                           width: 268,
//                           child: Image.asset("assets/slide3.png"),
//                         ),
//                         SizedBox(
//                           height: 35,
//                         ),
//                         Container(
//                           height: 8,
//                           width: 46,
//                           child: Image.asset("assets/logo/slide_3.png"),
//                         ),
//                       ],
//                     ),
//                     // SizedBox(height: 10,),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//   Widget _buildPageIndicator() {
//     Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
//     for (int i = 0; i < _slides.length; i++) {
//       row.children.add(_buildPageIndicatorItem(i));
//       if (i != _slides.length - 1)
//         // ignore: curly_braces_in_flow_control_structures
//         row.children.add(const SizedBox(
//           width: 10,
//         ));
//     }
//     return row;
//   }
//   Widget _buildPageIndicatorItem(int index) {
//     return Container(
//       width: index == _currentPage ? 12 : 8,
//       height: index == _currentPage ? 12 : 8,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: index == _currentPage ? Darkblue : greycolor),
//     );
//   }
// }
