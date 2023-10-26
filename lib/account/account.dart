// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfoodtracker/account/notifi.dart';
import 'package:myfoodtracker/account/payment.dart';
import 'package:myfoodtracker/account/profile.dart';
import 'package:myfoodtracker/favourite_/favurite.dart';
import 'package:myfoodtracker/help.dart';
import 'package:myfoodtracker/language.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/notification/notification.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<List1> ditails = [
    List1(
        image1: "assets/crad.png",
        name1: "Crab",
        name2: "6ct | \$4.50/ct",
        name3: "\$26.99")
  ];
  List<List2> ditails1 = [
    List2(
        image1: "assets/bluebarry.png",
        name1: "Bluebarry",
        name2: "approx 2lb",
        name3: "\$2.99")
  ];
  List<List3> ditails2 = [
    List3(
        image1: "assets/cabbage.png",
        name1: "Cabbage",
        name2: "\$3.50 / 500g",
        name3: "\$0.80")
  ];
  late Colornotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    status = previusstate ?? false;
    if (previusstate == null) {
      notifire.setlsDark = false;
    } else {
      notifire.setlsDark = previusstate;
    }
  }

  bool status = false;
  int cnt = 0;
  List<Slid> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _slides = [
      Slid("assets/veg1.png"),
      Slid("assets/veg1.png"),
      Slid("assets/veg1.png"),
    ];
    _pageController = PageController(initialPage: _currentPage);
    //  _controller = PageController(initialPage: 0);
    super.initState();
  }

  int _currentPage = 0;
  int currentIndex = 0;
  // late PageController _controller;

  void _incrementcount() {
    setState(() {
      cnt++;
    });
  }

  void _dicrementcount() {
    setState(() {
      if (cnt > 0) {
        cnt--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: notifire.spleshscreenprimerycolor,
            elevation: 0,
            actions: [
              Column(
                children: [
                  Row(children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 138, top: 10, left: 28),
                        height: 40,
                        width: 120,
                        child: Text("Account",
                            style: TextStyle(
                                color: notifire.textshscreenprimerycolor,
                                fontFamily: "AirbnbCereal_W_Bd",
                                fontSize: 24)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Favurite();
                          },
                        ));
                      },
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/logo/like.png",
                          color: notifire.textshscreenprimerycolor,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 5, left: 20, bottom: 4, right: 10),
                        //    color: notifire.spleshscreenprimerycolor,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Notifications();
                              },
                            ));
                          },
                          child: Stack(children: [
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 17,
                              width: 16,
                              child: Image.asset(
                                "assets/logo/notification.png",
                                color: notifire.textshscreenprimerycolor,
                                width: 17,
                                height: 16,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 8, bottom: 10),
                              height: 12,
                              width: 12,
                              child: Image.asset("assets/Badge.png"),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ]),
        backgroundColor: notifire.blackwhite,
        //  backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8, left: 28, right: 28),
                height: 282,
                width: 319,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 1, color: notifire.topscreenprimerycolor)),
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 201,
                      width: 319,
                    ),
                    Positioned(child: Image.asset("assets/frame.png")),
                    const Positioned(
                        left: 115,
                        top: 45,
                        right: 115,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/profile_1.png"),
                        )),
                    Positioned(
                      left: 125,
                      right: 79,
                      top: 125,
                      child: SizedBox(
                        height: 30,
                        width: 146,
                        child: Text(
                          "Albert",
                          // getData.read("user")["name"],
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "AirbnbCereal_W_Bd",
                              color: notifire.textshscreenprimerycolor),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 60,
                        top: 151,
                        left: 80,
                        child: SizedBox(
                          height: 30,
                          width: 140,
                          child: Text(
                            "Albert123@gmail.com",
                            // getData.read("user")["email"],
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "AirbnbCereal_W_Bk",
                                color: notifire.mintextscreenprimerycolor),
                          ),
                        )),
                    Positioned(
                        top: 200,
                        child: Container(
                          width: 319,
                          height: 1,
                          color: notifire.topscreenprimerycolor,
                        )),
                    Positioned(
                        left: 40,
                        top: 215,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Bottombar(),
                            ));
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 22),
                                height: 18,
                                width: 20,
                                child: Image.asset(
                                  "assets/logo/order.png",
                                  color: notifire.textshscreenprimerycolor,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 12, right: 22),
                                height: 20,
                                width: 54,
                                child: Text("My Order",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "AirbnbCereal_W_Md",
                                        color:
                                            notifire.textshscreenprimerycolor)),
                              )
                            ],
                          ),
                        )),
                    // Positioned(
                    //   left: 60,
                    //   top: 215,
                    //   child:
                    //   InkWell(onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //       return order();
                    //     },));
                    //   },
                    //     child:
                    //   Column(
                    //     children: [
                    //       Container(
                    //         height: 18,
                    //         width: 20,
                    //         child: Image.asset(
                    //           "assets/logo/order.png",
                    //           color: notifire.textshscreenprimerycolor,
                    //         ),
                    //       )
                    //     ],
                    //   ),),
                    // ),
                    // Positioned(
                    //   top: 245,
                    //   left: 45,
                    //   child: InkWell(onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //       return order();
                    //     },));
                    //   },
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           height: 20,
                    //           width: 54,
                    //           child: Text("My Order",
                    //               style: TextStyle(
                    //                   fontSize: 12,
                    //                   fontFamily: "AirbnbCereal_W_Md",
                    //                   color: notifire.textshscreenprimerycolor)),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      left: 130,
                      top: 215,
                      child: InkWell(
                          onTap: () {
                            /*Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Voucher();
                              },
                            ));*/
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 34),
                                height: 18,
                                width: 20,
                                child: Image.asset(
                                  "assets/logo/voucher.png",
                                  color: notifire.textshscreenprimerycolor,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 12, right: 32, left: 3),
                                height: 20,
                                width: 54,
                                child: Text("Voucher",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "AirbnbCereal_W_Md",
                                        color:
                                            notifire.textshscreenprimerycolor)),
                              )
                            ],
                          )),
                    ),
                    // Positioned(
                    //   left: 150,
                    //   top: 215,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(context, MaterialPageRoute(
                    //         builder: (context) {
                    //           return voucher();
                    //         },
                    //       ));
                    //     },
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           height: 18,
                    //           width: 20,
                    //           child: Image.asset(
                    //             "assets/logo/voucher.png",
                    //             color: notifire.textshscreenprimerycolor,
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 245,
                    //   left: 135,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(context, MaterialPageRoute(
                    //         builder: (context) {
                    //           return voucher();
                    //         },
                    //       ));
                    //     },
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           height: 20,
                    //           width: 54,
                    //           child: Text("Voucher",
                    //               style: TextStyle(
                    //                   fontSize: 12,
                    //                   fontFamily: "AirbnbCereal_W_Md",
                    //                   color:
                    //                       notifire.textshscreenprimerycolor)),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                        left: 220,
                        top: 215,
                        child: InkWell(
                          onTap: () {
                            /*Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Address();
                              },
                            ));*/
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 18),
                                height: 18,
                                width: 20,
                                child: Image.asset(
                                  "assets/logo/location.png",
                                  color: notifire.textshscreenprimerycolor,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 12, right: 15, left: 3),
                                height: 20,
                                width: 54,
                                child: Text("Address",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "AirbnbCereal_W_Md",
                                        color:
                                            notifire.textshscreenprimerycolor)),
                              )
                            ],
                          ),
                        )),
                    // Positioned(
                    //   left: 241,
                    //   top: 215,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(context, MaterialPageRoute(
                    //         builder: (context) {
                    //           return address();
                    //         },
                    //       ));
                    //     },
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           height: 18,
                    //           width: 20,
                    //           child: Image.asset(
                    //             "assets/logo/location.png",
                    //             color: notifire.textshscreenprimerycolor,
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 245,
                    //   left: 225,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(context, MaterialPageRoute(
                    //         builder: (context) {
                    //           return address();
                    //         },
                    //       ));
                    //     },
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           height: 20,
                    //           width: 54,
                    //           child: Text("Address",
                    //               style: TextStyle(
                    //                   fontSize: 12,
                    //                   fontFamily: "AirbnbCereal_W_Md",
                    //                   color:
                    //                       notifire.textshscreenprimerycolor)),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 28),
                height: 10,
                color: notifire.topscreenprimerycolor,
              ),
              SizedBox(
                height: 435,
                width: 375,
                child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Profile();
                            },
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                              margin: const EdgeInsets.only(left: 15, top: 15),
                              child: Image.asset(
                                "assets/logo/pro.png",
                                height: 21,
                                width: 18,
                                color: notifire.mintextscreenprimerycolor,
                              )),
                          title: Container(
                            margin: const EdgeInsets.only(top: 14, left: 9),
                            child: Text("Profile & Security",
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    fontSize: 14,
                                    color: notifire.textshscreenprimerycolor)),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.only(top: 18),
                            child: Icon(
                              Icons.chevron_right_outlined,
                              color: notifire.mintextscreenprimerycolor,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Payment();
                            },
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                              margin: const EdgeInsets.only(left: 15, top: 4),
                              child: Image.asset(
                                "assets/logo/pay.png",
                                height: 21,
                                width: 18,
                                color: notifire.mintextscreenprimerycolor,
                              )),
                          title: Container(
                            margin: const EdgeInsets.only(left: 9),
                            child: Text("Payments Option",
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    fontSize: 14,
                                    color: notifire.textshscreenprimerycolor)),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.chevron_right_outlined,
                              color: notifire.mintextscreenprimerycolor,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Favurite();
                            },
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                              margin: const EdgeInsets.only(left: 15, top: 3),
                              child: Image.asset(
                                "assets/logo/favr.png",
                                height: 21,
                                width: 18,
                                color: notifire.mintextscreenprimerycolor,
                              )),
                          title: Container(
                            margin: const EdgeInsets.only(left: 9),
                            child: Text("Favorite List",
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    fontSize: 14,
                                    color: notifire.textshscreenprimerycolor)),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.chevron_right_outlined,
                              color: notifire.mintextscreenprimerycolor,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Notifi();
                            },
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                              margin: const EdgeInsets.only(left: 15, top: 3),
                              child: Image.asset(
                                "assets/logo/notification_2.png",
                                height: 21,
                                width: 18,
                                color: notifire.mintextscreenprimerycolor,
                              )),
                          title: Container(
                            margin: const EdgeInsets.only(left: 9),
                            child: Text("Notifications",
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    fontSize: 14,
                                    color: notifire.textshscreenprimerycolor)),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.chevron_right_outlined,
                              color: notifire.mintextscreenprimerycolor,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Helpcentre();
                            },
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: Image.asset(
                                "assets/logo/Help_1.png",
                                height: 21,
                                width: 18,
                                color: notifire.mintextscreenprimerycolor,
                              )),
                          title: Container(
                            margin: const EdgeInsets.only(left: 9),
                            child: Text("Help Center",
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    fontSize: 14,
                                    color: notifire.textshscreenprimerycolor)),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.chevron_right_outlined,
                              color: notifire.mintextscreenprimerycolor,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Language();
                            },
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: Image.asset(
                                "assets/logo/language_1.png",
                                height: 21,
                                width: 18,
                                color: notifire.mintextscreenprimerycolor,
                              )),
                          title: Container(
                            margin: const EdgeInsets.only(left: 9),
                            child: Text("Change Language",
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    fontSize: 14,
                                    color: notifire.textshscreenprimerycolor)),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.chevron_right_outlined,
                              color: notifire.mintextscreenprimerycolor,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              "assets/logo/delete_2.png",
                              height: 21,
                              width: 18,
                              color: notifire.mintextscreenprimerycolor,
                            )),
                        title: Container(
                          margin: const EdgeInsets.only(left: 9),
                          child: Text("Delete Account",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  fontSize: 14,
                                  color: notifire.textshscreenprimerycolor)),
                        ),
                        trailing: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            color: notifire.mintextscreenprimerycolor,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              "assets/logo/dark.png",
                              height: 21,
                              width: 18,
                              color: notifire.mintextscreenprimerycolor,
                            )),
                        title: Container(
                          margin: const EdgeInsets.only(left: 9),
                          child: Text("Dark Mode",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  fontSize: 14,
                                  color: notifire.textshscreenprimerycolor)),
                        ),
                        trailing: Container(
                          margin: const EdgeInsets.only(left: 80),
                          height: 40,
                          width: 80,
                          child: Transform.scale(
                            alignment: Alignment.centerRight,
                            scale: 0.7,
                            child: CupertinoSwitch(
                              // iconOn: Icons.nightlight,
                              // iconOff: Icons.sunny,
                              // animationDuration:
                              //     const Duration(milliseconds: 200),
                              // textOn: 'Dark',
                              // textOff: 'Light',
                              // colorOn: const Color(0xff242424),
                              // colorOff: const Color(0xff1F75EC),
                              value: status,
                              onChanged: (bool value) async {
                                setState(() {
                                  status = value;
                                });
                                final prefs =
                                    await SharedPreferences.getInstance();
                                setState(
                                  () {
                                    notifire.setlsDark = value;
                                    prefs.setBool("setIsDark", value);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 28),
                height: 10,
                color: notifire.topscreenprimerycolor,
              ),
              Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 28, right: 200, top: 28),
                    height: 30,
                    width: 135,
                    child: Text("Your Last Order",
                        style: TextStyle(
                            fontSize: 16,
                            color: notifire.textshscreenprimerycolor,
                            fontFamily: "AirbnbCereal_W_Bd")),
                  )
                ],
              ),
              //SingleChildScrollView(scrollDirection: Axis.horizontal),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 28),
                      height: 240,
                      width: 152,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade50.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ditails.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder: (BuildContext
                                            context,
                                        StateSetter
                                            setState1 /*You can rename this!*/) {
                                      return SizedBox(
                                          child: SingleChildScrollView(
                                              child: Column(children: [
                                        Container(
                                            margin:
                                                const EdgeInsets.only(top: 70),
                                            height: 610,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: notifire
                                                    .spleshscreenprimerycolor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(28),
                                                        topRight:
                                                            Radius.circular(
                                                                28))),
                                            child: Column(children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 30),
                                                height: 5,
                                                width: 50,
                                                child: Image.asset(
                                                    "assets/Line.png"),
                                              ),
                                              Column(children: [
                                                Center(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 18,
                                                            top: 20,
                                                            right: 18),
                                                    height: 319,
                                                    width: 319,
                                                    child: Stack(
                                                      children: [
                                                        PageView(
                                                            controller:
                                                                _pageController,
                                                            onPageChanged: (index) =>
                                                                _handlingOnPageChanged(
                                                                    index,
                                                                    setState1),
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            children:
                                                                _buildSlides()),
                                                        Positioned(
                                                            bottom: 40,
                                                            left: 130,
                                                            child:
                                                                _buildPageIndicator())
                                                      ],
                                                    ),
                                                    // child: PageView.builder(
                                                    //     itemCount: slide.length,
                                                    //     itemBuilder: (_, i) {
                                                    //       return Column(
                                                    //           children: [
                                                    //             Row(
                                                    //               children: [
                                                    //                 Container(
                                                    //                   margin: EdgeInsets.only(
                                                    //                       left:
                                                    //                       20,
                                                    //                       right:
                                                    //                       20),
                                                    //                   height: 270,
                                                    //                   width: 270,
                                                    //                   //color: Colors.blueAccent,
                                                    //                   child: Image
                                                    //                       .asset(
                                                    //                       "${ditails3[index].image1}"),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //             Row(
                                                    //               children: [
                                                    //                 Center(
                                                    //                   child:
                                                    //                   Container(
                                                    //                     margin: EdgeInsets.only(
                                                    //                         left:
                                                    //                         130,
                                                    //                         right:
                                                    //                         120),
                                                    //                     height: 8,
                                                    //                     width: 46,
                                                    //                     child: Image
                                                    //                         .asset(
                                                    //                       "${slide[i]}",
                                                    //                       color: Colors
                                                    //                           .black87,
                                                    //                     ),
                                                    //                   ),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //           ]);
                                                    //     }),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  top: 20,
                                                                  right: 28),
                                                          height: 30,
                                                          width: 220,
                                                          child: Text(
                                                              "${ditails[index].name1}",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: notifire
                                                                      .textshscreenprimerycolor,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Md")),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  bottom: 20,
                                                                  right: 150),
                                                          height: 30,
                                                          width: 100,
                                                          child: Text(
                                                              "${ditails[index].name2}",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: notifire
                                                                      .mintextscreenprimerycolor,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Bk")),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    height: 50,
                                                    width: 375,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  bottom: 20,
                                                                  top: 10),
                                                          height: 30,
                                                          //     width: 55,
                                                          child: Text(
                                                            "${ditails[index].name3}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "AirbnbCereal_W_Bk",
                                                                fontSize: 16,
                                                                color: notifire
                                                                    .textshscreenprimerycolor),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10,
                                                                  right: 15),
                                                          height: 20,
                                                          width: 19,
                                                          child: Text("/er",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Bk",
                                                                  color: notifire
                                                                      .mintextscreenprimerycolor)),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            return setState(() {
                                                              _dicrementcount();
                                                            });
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 77),
                                                            height: 50,
                                                            width: 50,
                                                            child: Image.asset(
                                                                "assets/logo/mainas.png"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 50,
                                                          width: 50,
                                                          child: Center(
                                                              child: Text(
                                                            "$cnt",
                                                            style: TextStyle(
                                                                color: notifire
                                                                    .textshscreenprimerycolor),
                                                          )),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            return setState(() {
                                                              _incrementcount();
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child: Image.asset(
                                                                "assets/logo/plus_1.png"),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = 2;
                                                      });
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return const Bottombar();
                                                        },
                                                      ));
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              bottom: 10),
                                                      height: 50,
                                                      width: 290,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff00AB67),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: const Center(
                                                          child: Text(
                                                        "Add to Cart",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "AirbnbCereal_W_Md",
                                                            color:
                                                                Colors.white),
                                                      )),
                                                    ),
                                                  )
                                                ])
                                              ])
                                            ]))
                                      ])));
                                    });
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    height: 120,
                                    width: 120,
                                    child:
                                        Image.asset("${ditails[index].image1}"),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16, top: 6),
                                    height: 30,
                                    width: 120,
                                    child: Text(
                                      "${ditails[index].name1}",
                                      style: TextStyle(
                                          fontFamily: "AirbnbCereal_W_Md",
                                          color:
                                              notifire.textshscreenprimerycolor,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 120,
                                    child: Text(
                                      "${ditails[index].name2}",
                                      style: TextStyle(
                                          fontFamily: "AirbnbCereal_W_Bk",
                                          color: notifire
                                              .mintextscreenprimerycolor,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, top: 16),
                                        height: 30,
                                        width: 56,
                                        child: Text(
                                          "${ditails[index].name3}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: notifire
                                                  .textshscreenprimerycolor,
                                              fontFamily: "AirbnbCereal_W_Md"),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 30),
                                        height: 20,
                                        width: 19,
                                        child: Text(
                                          "/ea",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Bk",
                                              fontSize: 12,
                                              color: notifire
                                                  .mintextscreenprimerycolor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                          "assets/plus.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ));
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 240,
                      width: 152,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ditails.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder: (BuildContext
                                            context,
                                        StateSetter
                                            setState1 /*You can rename this!*/) {
                                      return SizedBox(
                                          child: SingleChildScrollView(
                                              child: Column(children: [
                                        Container(
                                            margin:
                                                const EdgeInsets.only(top: 70),
                                            height: 610,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: notifire
                                                    .spleshscreenprimerycolor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(28),
                                                        topRight:
                                                            Radius.circular(
                                                                28))),
                                            child: Column(children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 30),
                                                height: 5,
                                                width: 50,
                                                child: Image.asset(
                                                    "assets/Line.png"),
                                              ),
                                              Column(children: [
                                                Center(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 18,
                                                            top: 20,
                                                            right: 18),
                                                    height: 319,
                                                    width: 319,
                                                    child: Stack(
                                                      children: [
                                                        PageView(
                                                            controller:
                                                                _pageController,
                                                            onPageChanged: (index) =>
                                                                _handlingOnPageChanged(
                                                                    index,
                                                                    setState1),
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            children:
                                                                _buildSlides()),
                                                        Positioned(
                                                            bottom: 40,
                                                            left: 130,
                                                            child:
                                                                _buildPageIndicator())
                                                      ],
                                                    ),
                                                    // child: PageView.builder(
                                                    //     itemCount: slide.length,
                                                    //     itemBuilder: (_, i) {
                                                    //       return Column(
                                                    //           children: [
                                                    //             Row(
                                                    //               children: [
                                                    //                 Container(
                                                    //                   margin: EdgeInsets.only(
                                                    //                       left:
                                                    //                       20,
                                                    //                       right:
                                                    //                       20),
                                                    //                   height: 270,
                                                    //                   width: 270,
                                                    //                   //color: Colors.blueAccent,
                                                    //                   child: Image
                                                    //                       .asset(
                                                    //                       "${ditails3[index].image1}"),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //             Row(
                                                    //               children: [
                                                    //                 Center(
                                                    //                   child:
                                                    //                   Container(
                                                    //                     margin: EdgeInsets.only(
                                                    //                         left:
                                                    //                         130,
                                                    //                         right:
                                                    //                         120),
                                                    //                     height: 8,
                                                    //                     width: 46,
                                                    //                     child: Image
                                                    //                         .asset(
                                                    //                       "${slide[i]}",
                                                    //                       color: Colors
                                                    //                           .black87,
                                                    //                     ),
                                                    //                   ),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //           ]);
                                                    //     }),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  top: 20,
                                                                  right: 28),
                                                          height: 30,
                                                          width: 220,
                                                          child: Text(
                                                              "${ditails[index].name1}",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: notifire
                                                                      .textshscreenprimerycolor,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Md")),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  bottom: 20,
                                                                  right: 150),
                                                          height: 30,
                                                          width: 100,
                                                          child: Text(
                                                              "${ditails[index].name2}",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: notifire
                                                                      .mintextscreenprimerycolor,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Bk")),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    height: 50,
                                                    width: 375,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  bottom: 20,
                                                                  top: 10),
                                                          height: 30,
                                                          //     width: 55,
                                                          child: Text(
                                                            "${ditails[index].name3}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "AirbnbCereal_W_Bk",
                                                                fontSize: 16,
                                                                color: notifire
                                                                    .textshscreenprimerycolor),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10,
                                                                  right: 15),
                                                          height: 20,
                                                          width: 19,
                                                          child: Text("/er",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Bk",
                                                                  color: notifire
                                                                      .mintextscreenprimerycolor)),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            return setState(() {
                                                              _dicrementcount();
                                                            });
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 77),
                                                            height: 50,
                                                            width: 50,
                                                            child: Image.asset(
                                                                "assets/logo/mainas.png"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 50,
                                                          width: 50,
                                                          child: Center(
                                                              child: Text(
                                                            "$cnt",
                                                            style: TextStyle(
                                                                color: notifire
                                                                    .textshscreenprimerycolor),
                                                          )),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            return setState(() {
                                                              _incrementcount();
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child: Image.asset(
                                                                "assets/logo/plus_1.png"),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = 2;
                                                      });
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return const Bottombar();
                                                        },
                                                      ));
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              bottom: 10),
                                                      height: 50,
                                                      width: 290,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff00AB67),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: const Center(
                                                          child: Text(
                                                        "Add to Cart",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "AirbnbCereal_W_Md",
                                                            color:
                                                                Colors.white),
                                                      )),
                                                    ),
                                                  )
                                                ])
                                              ])
                                            ]))
                                      ])));
                                    });
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    height: 120,
                                    width: 120,
                                    child: Image.asset(
                                        "${ditails1[index].image1}"),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16, top: 6),
                                    height: 30,
                                    width: 120,
                                    child: Text(
                                      "${ditails1[index].name1}",
                                      style: TextStyle(
                                          fontFamily: "AirbnbCereal_W_Md",
                                          color:
                                              notifire.textshscreenprimerycolor,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 120,
                                    child: Text(
                                      "${ditails1[index].name2}",
                                      style: TextStyle(
                                          fontFamily: "AirbnbCereal_W_Bk",
                                          color: notifire
                                              .mintextscreenprimerycolor,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, top: 16),
                                        height: 30,
                                        width: 56,
                                        child: Text(
                                          "${ditails1[index].name3}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: notifire
                                                  .textshscreenprimerycolor,
                                              fontFamily: "AirbnbCereal_W_Md"),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 30),
                                        height: 20,
                                        width: 19,
                                        child: Text(
                                          "/ea",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Bk",
                                              fontSize: 12,
                                              color: notifire
                                                  .mintextscreenprimerycolor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                          "assets/plus.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ));
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 240,
                      width: 152,
                      decoration: BoxDecoration(
                        color: Colors.green.shade50.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ditails.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder: (BuildContext
                                            context,
                                        StateSetter
                                            setState1 /*You can rename this!*/) {
                                      return SizedBox(
                                          child: SingleChildScrollView(
                                              child: Column(children: [
                                        Container(
                                            margin:
                                                const EdgeInsets.only(top: 70),
                                            height: 610,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: notifire
                                                    .spleshscreenprimerycolor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(28),
                                                        topRight:
                                                            Radius.circular(
                                                                28))),
                                            child: Column(children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 30),
                                                height: 5,
                                                width: 50,
                                                child: Image.asset(
                                                    "assets/Line.png"),
                                              ),
                                              Column(children: [
                                                Center(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 18,
                                                            top: 20,
                                                            right: 18),
                                                    height: 319,
                                                    width: 319,
                                                    child: Stack(
                                                      children: [
                                                        PageView(
                                                            controller:
                                                                _pageController,
                                                            onPageChanged: (index) =>
                                                                _handlingOnPageChanged(
                                                                    index,
                                                                    setState1),
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            children:
                                                                _buildSlides()),
                                                        Positioned(
                                                            bottom: 40,
                                                            left: 130,
                                                            child:
                                                                _buildPageIndicator())
                                                      ],
                                                    ),
                                                    // child: PageView.builder(
                                                    //     itemCount: slide.length,
                                                    //     itemBuilder: (_, i) {
                                                    //       return Column(
                                                    //           children: [
                                                    //             Row(
                                                    //               children: [
                                                    //                 Container(
                                                    //                   margin: EdgeInsets.only(
                                                    //                       left:
                                                    //                       20,
                                                    //                       right:
                                                    //                       20),
                                                    //                   height: 270,
                                                    //                   width: 270,
                                                    //                   //color: Colors.blueAccent,
                                                    //                   child: Image
                                                    //                       .asset(
                                                    //                       "${ditails3[index].image1}"),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //             Row(
                                                    //               children: [
                                                    //                 Center(
                                                    //                   child:
                                                    //                   Container(
                                                    //                     margin: EdgeInsets.only(
                                                    //                         left:
                                                    //                         130,
                                                    //                         right:
                                                    //                         120),
                                                    //                     height: 8,
                                                    //                     width: 46,
                                                    //                     child: Image
                                                    //                         .asset(
                                                    //                       "${slide[i]}",
                                                    //                       color: Colors
                                                    //                           .black87,
                                                    //                     ),
                                                    //                   ),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //           ]);
                                                    //     }),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  top: 20,
                                                                  right: 28),
                                                          height: 30,
                                                          width: 220,
                                                          child: Text(
                                                              "${ditails[index].name1}",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: notifire
                                                                      .textshscreenprimerycolor,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Md")),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  bottom: 20,
                                                                  right: 150),
                                                          height: 30,
                                                          width: 100,
                                                          child: Text(
                                                              "${ditails[index].name2}",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: notifire
                                                                      .mintextscreenprimerycolor,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Bk")),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    height: 50,
                                                    width: 375,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 28,
                                                                  bottom: 20,
                                                                  top: 10),
                                                          height: 30,
                                                          //     width: 55,
                                                          child: Text(
                                                            "${ditails[index].name3}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "AirbnbCereal_W_Bk",
                                                                fontSize: 16,
                                                                color: notifire
                                                                    .textshscreenprimerycolor),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10,
                                                                  right: 15),
                                                          height: 20,
                                                          width: 19,
                                                          child: Text("/er",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "AirbnbCereal_W_Bk",
                                                                  color: notifire
                                                                      .mintextscreenprimerycolor)),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            return setState(() {
                                                              _dicrementcount();
                                                            });
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 77),
                                                            height: 50,
                                                            width: 50,
                                                            child: Image.asset(
                                                                "assets/logo/mainas.png"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 50,
                                                          width: 50,
                                                          child: Center(
                                                              child: Text(
                                                            "$cnt",
                                                            style: TextStyle(
                                                                color: notifire
                                                                    .textshscreenprimerycolor),
                                                          )),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            return setState(() {
                                                              _incrementcount();
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child: Image.asset(
                                                                "assets/logo/plus_1.png"),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = 2;
                                                      });
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return const Bottombar();
                                                        },
                                                      ));
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              bottom: 10),
                                                      height: 50,
                                                      width: 290,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff00AB67),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: const Center(
                                                          child: Text(
                                                        "Add to Cart",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "AirbnbCereal_W_Md",
                                                            color:
                                                                Colors.white),
                                                      )),
                                                    ),
                                                  )
                                                ])
                                              ])
                                            ]))
                                      ])));
                                    });
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    height: 120,
                                    width: 120,
                                    child: Image.asset(
                                        "${ditails2[index].image1}"),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16, top: 6),
                                    height: 30,
                                    width: 120,
                                    child: Text(
                                      "${ditails2[index].name1}",
                                      style: TextStyle(
                                          fontFamily: "AirbnbCereal_W_Md",
                                          color:
                                              notifire.textshscreenprimerycolor,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 120,
                                    child: Text(
                                      "${ditails2[index].name2}",
                                      style: TextStyle(
                                          fontFamily: "AirbnbCereal_W_Bk",
                                          color: notifire
                                              .mintextscreenprimerycolor,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, top: 16),
                                        height: 30,
                                        width: 56,
                                        child: Text(
                                          "${ditails2[index].name3}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: notifire
                                                  .textshscreenprimerycolor,
                                              fontFamily: "AirbnbCereal_W_Md"),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 30),
                                        height: 20,
                                        width: 19,
                                        child: Text(
                                          "/ea",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Bk",
                                              fontSize: 12,
                                              color: notifire
                                                  .mintextscreenprimerycolor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                          "assets/plus.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ));
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  Widget _buildSlide(Slid slid) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: Column(
        children: <Widget>[
          // SizedBox(height: Get.height * 0.12),

          // ignore: sized_box_for_whitespace
          Padding(
            padding: const EdgeInsets.all(8.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              // height: Get.height / 2, //imagee size
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      slid.image,
                      fit: BoxFit.cover,
                      //    height: Get.height / 1.9,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: Get.height * 0.05,
          // ),
        ],
      ),
    );
  }

  _handlingOnPageChanged(int index, StateSetter setState1) {
    // print('handle page--->$index');
    // setState(() => _currentPage = index);

    setState1(() => _currentPage = index);
    // print('handle _currentPage--->$_currentPage');
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row =
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        // ignore: curly_braces_in_flow_control_structures
        row.children.add(const SizedBox(
          width: 10,
        ));
      // setState1;
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    // print("index--->${index}");
    // print("currentIndex--->${_currentPage}");

    return Container(
      width: index == _currentPage ? 12 : 8,
      height: index == _currentPage ? 12 : 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? const Color(0xff00AB67)
              : const Color(0xff00AB67).withOpacity(0.2)),
    );
  }
}

class List1 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List1({this.image1, this.name1, this.name2, this.name3});
}

class List2 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List2({this.image1, this.name1, this.name2, this.name3});
}

class List3 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List3({this.image1, this.name1, this.name2, this.name3});
}

class Slid {
  String image;

  Slid(this.image);
}
