// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favurite extends StatefulWidget {
  const Favurite({Key? key}) : super(key: key);

  @override
  State<Favurite> createState() => _FavuriteState();
}

class _FavuriteState extends State<Favurite> {
  int currentInde = 0;
  //late PageController _controller;
  int cnt = 0;
  List<String> slide = [
    "assets/logo/slide_1.png",
    "assets/logo/slide_2.png",
    "assets/logo/slide_3.png"
  ];
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
  List<List5> ditails3 = [
    List5(
        image1: "assets/kiwi.png",
        name1: "Kiwifruit",
        name2: "approx 0.25lb",
        name3: "\$0.89"),
    List5(
        image1: "assets/cobbage1.png",
        name1: "Cobbage",
        name2: "approx 2lb",
        name3: "\$3.49"),
    List5(
        image1: "assets/crad.png",
        name1: "Crab",
        name2: "6ct | \$4.50/ct",
        name3: "\$26.9"),
    List5(
        image1: "assets/almond.png",
        name1: "Almond",
        name2: "16oz | \$8.99/lb",
        name3: "\$8.99"),
    List5(
        image1: "assets/pasta.png",
        name1: "Pasta",
        name2: "19oz | \$4.91/lb",
        name3: "\$3.49"),
    List5(
        image1: "assets/beef.png",
        name1: "Beef Chuck Stew",
        name2: "12 - 14ct/lb",
        name3: "\$26.99"),
  ];
  List<List4> ditails4 = [
    List4(
        image1: "assets/veg1.png",
        name1: "Brocoli",
        name2: "approx 0.6lb",
        name3: "\$1.29"),
    List4(
        image1: "assets/veg2.png",
        name1: "Cobbage",
        name2: "approx 6oz",
        name3: "\$3.49"),
    List4(
        image1: "assets/veg3.png",
        name1: "Carrot",
        name2: "approx 1lb",
        name3: "\$2.49"),
    List4(
        image1: "assets/veg4.png",
        name1: "Corn",
        name2: "4ct, approx 2lb",
        name3: "\$5.99"),
    List4(
        image1: "assets/veg5.png",
        name1: "Pepper",
        name2: "approx 1oz",
        name3: "\$0.49"),
    List4(
        image1: "assets/veg6.png",
        name1: "Potato",
        name2: "approx 3lb bag",
        name3: "\$6.99"),
  ];
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
  // late TabController _tabController;

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
  late PageController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: notifire.spleshscreenprimerycolor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 50,
        actions: [
          Row(children: [
            // SizedBox(width: 10,),
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
                  left: 80, right: 90, top: 8, bottom: 10),
              child: Center(
                child: Text(
                  "Favorite Lists",
                  style: TextStyle(
                      fontSize: 14,
                      color: notifire.textshscreenprimerycolor,
                      fontFamily: "AirbnbCereal_W_Bd"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 28),
              padding:
                  const EdgeInsets.only(top: 7, bottom: 7, left: 7, right: 7),
              height: 30,
              width: 30,
              child: Image.asset(
                "assets/logo/fav.png",
                color: notifire.mintextscreenprimerycolor,
              ),
            )
          ]),
        ],
      ),
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 15),
              height: 50,
              width: 319,
              decoration: BoxDecoration(
                color: notifire.topscreenprimerycolor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 50,
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search in favorite list",
                          hintStyle: TextStyle(
                              color: notifire.mintextscreenprimerycolor)
                          //  icon: Icon(Icons.search),
                          //  labelText: "user name"
                          ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 60),
                    child: Icon(Icons.search,
                        color: notifire.mintextscreenprimerycolor),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
            SizedBox(
              height: 660,
              width: 375,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ditails4.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 110,
                      width: 375,
                      child: Slidable(
                        key: Key("$ditails4"),
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                ditails4.removeAt(index);
                              });
                            },
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                            label: "Remove List",
                          )
                        ]),
                        child: InkWell(
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
                                        margin: const EdgeInsets.only(top: 70),
                                        height: 610,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: notifire
                                                .spleshscreenprimerycolor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(28),
                                                    topRight:
                                                        Radius.circular(28))),
                                        child: Column(children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 30),
                                            height: 5,
                                            width: 50,
                                            child:
                                                Image.asset("assets/Line.png"),
                                          ),
                                          Column(children: [
                                            Center(
                                              child: Container(
                                                margin: const EdgeInsets.only(
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
                                                // child: Container(
                                                //   margin: EdgeInsets.only(
                                                //       left: 18,
                                                //       top: 20,
                                                //       right: 18),
                                                //   height: 319,
                                                //   width: 319,
                                                //
                                                //   decoration: BoxDecoration( color: Color(0xffF2FBF7),borderRadius: BorderRadius.circular(10)),
                                                //   child: PageView.builder(
                                                //       itemCount: slide.length,
                                                //       itemBuilder: (_, i) {
                                                //         return Column(
                                                //             children: [
                                                //               Row(
                                                //                 children: [
                                                //                   Container(
                                                //                     margin: EdgeInsets
                                                //                         .only(
                                                //                         left: 20,
                                                //                         right: 20),
                                                //                     height: 270,
                                                //                     width: 270,
                                                //                     //color: Colors.blueAccent,
                                                //                     child: Image
                                                //                         .asset(
                                                //                         "${ditails4[index]
                                                //                             .image1}"),
                                                //                   ),
                                                //                 ],
                                                //               ),
                                                //               Row(
                                                //                 children: [
                                                //                   Center(
                                                //                     child: Container(
                                                //                       margin:
                                                //                       EdgeInsets
                                                //                           .only(
                                                //                           left: 130,
                                                //                           right: 120),
                                                //                       height: 8,
                                                //                       width: 46,
                                                //                       child: Image
                                                //                           .asset(
                                                //                         "${slide[i]}",
                                                //                         color:
                                                //                         Colors
                                                //                             .black87,
                                                //                       ),
                                                //                     ),
                                                //                   ),
                                                //                 ],
                                                //               ),
                                                //             ]);
                                                //       }),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 28,
                                                              top: 20,
                                                              right: 28),
                                                      height: 30,
                                                      width: 71,
                                                      child: Text(
                                                          "${ditails4[index].name1}",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color: notifire
                                                                  .textshscreenprimerycolor,
                                                              fontFamily:
                                                                  "AirbnbCereal_W_Md")),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 28,
                                                              bottom: 20),
                                                      height: 30,
                                                      width: 100,
                                                      child: Text(
                                                          "${ditails4[index].name2}",
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
                                                margin: const EdgeInsets.only(
                                                    bottom: 20),
                                                height: 50,
                                                width: 375,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 28,
                                                              bottom: 20,
                                                              top: 10),
                                                      height: 30,
                                                      //     width: 55,
                                                      child: Text(
                                                        "${ditails4[index].name3}",
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
                                                          const EdgeInsets.only(
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
                                                        margin: const EdgeInsets
                                                            .only(left: 77),
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
                                                  margin: const EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      bottom: 10),
                                                  height: 50,
                                                  width: 290,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff00AB67),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  child: const Center(
                                                      child: Text(
                                                    "Add to Cart",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            "AirbnbCereal_W_Md",
                                                        color: Colors.white),
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
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 15,
                                      top: 14,
                                    ),
                                    height: 96,
                                    width: 96,
                                    child: Image.asset(
                                        "${ditails4[index].image1}"),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, top: 14, right: 150),
                                        width: 65,
                                        child: Text(
                                          "${ditails4[index].name1}",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Md",
                                              fontSize: 14,
                                              color: notifire
                                                  .textshscreenprimerycolor),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 85),
                                        width: 132,
                                        child: Text(
                                          "${ditails4[index].name2}",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Bk",
                                              fontSize: 12,
                                              color: notifire
                                                  .mintextscreenprimerycolor),
                                        ),
                                      ),
                                      Row(children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 16, top: 16),
                                          height: 30,
                                          //     width: 55,
                                          child: Text(
                                            "${ditails4[index].name3}",
                                            style: TextStyle(
                                                fontFamily: "AirbnbCereal_W_Bk",
                                                fontSize: 16,
                                                color: notifire
                                                    .textshscreenprimerycolor),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 10, right: 75, top: 16),
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
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 22),
                                          height: 16,
                                          width: 16,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  ditails4.removeAt(index);
                                                });
                                              },
                                              child: Image.asset(
                                                "assets/logo/delete.png",
                                                color: notifire
                                                    .mintextscreenprimerycolor,
                                              )),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 14),
                                          height: 30,
                                          width: 30,
                                          child: Image.asset(
                                            "assets/plus1.png",
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ]),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),

            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 28, right: 250, top: 28),
                  height: 30,
                  width: 75,
                  child: Text("Top Picks",
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: notifire
                                                  .spleshscreenprimerycolor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(28),
                                                      topRight:
                                                          Radius.circular(28))),
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
                                                  margin: const EdgeInsets.only(
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
                                                        margin: const EdgeInsets
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
                                                        margin: const EdgeInsets
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
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  height: 50,
                                                  width: 375,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
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
                                                        margin: const EdgeInsets
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
                                                                .circular(16)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Add to Cart",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "AirbnbCereal_W_Md",
                                                          color: Colors.white),
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
                                        color:
                                            notifire.mintextscreenprimerycolor,
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
                                      margin: const EdgeInsets.only(right: 30),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: notifire
                                                  .spleshscreenprimerycolor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(28),
                                                      topRight:
                                                          Radius.circular(28))),
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
                                                  margin: const EdgeInsets.only(
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
                                                        margin: const EdgeInsets
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
                                                        margin: const EdgeInsets
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
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  height: 50,
                                                  width: 375,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
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
                                                        margin: const EdgeInsets
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
                                                                .circular(16)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Add to Cart",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "AirbnbCereal_W_Md",
                                                          color: Colors.white),
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
                                      Image.asset("${ditails1[index].image1}"),
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
                                        color:
                                            notifire.mintextscreenprimerycolor,
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
                                      margin: const EdgeInsets.only(right: 30),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: notifire
                                                  .spleshscreenprimerycolor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(28),
                                                      topRight:
                                                          Radius.circular(28))),
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
                                                  margin: const EdgeInsets.only(
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
                                                        margin: const EdgeInsets
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
                                                        margin: const EdgeInsets
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
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  height: 50,
                                                  width: 375,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
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
                                                        margin: const EdgeInsets
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
                                                                .circular(16)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Add to Cart",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "AirbnbCereal_W_Md",
                                                          color: Colors.white),
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
                                      Image.asset("${ditails2[index].image1}"),
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
                                        color:
                                            notifire.mintextscreenprimerycolor,
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
                                      margin: const EdgeInsets.only(right: 30),
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
              margin: const EdgeInsets.only(top: 20),
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
            Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              // color: Colors.blue,
              color: notifire.spleshscreenprimerycolor,

              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    mainAxisExtent: 230),
                itemCount: ditails3.length,
                addRepaintBoundaries: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: notifire.topscreenprimerycolor)),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context,
                                    StateSetter
                                        setState1 /*You can rename this!*/) {
                              return SizedBox(
                                  child: SingleChildScrollView(
                                      child: Column(children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 70),
                                    height: 610,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color:
                                            notifire.spleshscreenprimerycolor,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(28),
                                            topRight: Radius.circular(28))),
                                    child: Column(children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 30),
                                        height: 5,
                                        width: 50,
                                        child: Image.asset("assets/Line.png"),
                                      ),
                                      Column(children: [
                                        Center(
                                            child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 18, top: 20, right: 18),
                                          height: 319,
                                          width: 319,
                                          child: Stack(
                                            children: [
                                              PageView(
                                                  controller: _pageController,
                                                  onPageChanged: (index) =>
                                                      _handlingOnPageChanged(
                                                          index, setState1),
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  children: _buildSlides()),
                                              Positioned(
                                                  bottom: 40,
                                                  left: 130,
                                                  child: _buildPageIndicator())
                                            ],
                                          ),
                                          // child: Container(
                                          //   margin: EdgeInsets.only(
                                          //       left: 18,
                                          //       top: 20,
                                          //       right: 18),
                                          //   height: 319,
                                          //   width: 319,
                                          //
                                          //   decoration: BoxDecoration( color: Color(0xffF2FBF7),borderRadius: BorderRadius.circular(10)),
                                          //   child: PageView.builder(
                                          //       itemCount: slide.length,
                                          //       itemBuilder: (_, i) {
                                          //         return Column(
                                          //             children: [
                                          //               Row(
                                          //                 children: [
                                          //                   Container(
                                          //                     margin: EdgeInsets
                                          //                         .only(
                                          //                         left: 20,
                                          //                         right: 20),
                                          //                     height: 270,
                                          //                     width: 270,
                                          //                     //color: Colors.blueAccent,
                                          //                     child: Image
                                          //                         .asset(
                                          //                         "${ditails3[index]
                                          //                             .image1}"),
                                          //                   ),
                                          //                 ],
                                          //               ),
                                          //               Row(
                                          //                 children: [
                                          //                   Center(
                                          //                     child: Container(
                                          //                       margin:
                                          //                       EdgeInsets
                                          //                           .only(
                                          //                           left: 130,
                                          //                           right: 120),
                                          //                       height: 8,
                                          //                       width: 46,
                                          //                       child: Image
                                          //                           .asset(
                                          //                         "${slide[i]}",
                                          //                         color:
                                          //                         Colors
                                          //                             .black87,
                                          //                       ),
                                          //                     ),
                                          //                   ),
                                          //                 ],
                                          //               ),
                                          //             ]);
                                          //       }),
                                          // ),
                                        )),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 28,
                                                      top: 20,
                                                      right: 28),
                                                  height: 30,
                                                  width: 220,
                                                  child: Text(
                                                      "${ditails3[index].name1}",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: notifire
                                                              .textshscreenprimerycolor,
                                                          fontFamily:
                                                              "AirbnbCereal_W_Md")),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 28,
                                                      bottom: 20,
                                                      right: 150),
                                                  height: 30,
                                                  width: 100,
                                                  child: Text(
                                                      "${ditails3[index].name2}",
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
                                            margin: const EdgeInsets.only(
                                                bottom: 20),
                                            height: 50,
                                            width: 375,
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 28,
                                                      bottom: 20,
                                                      top: 10),
                                                  height: 30,
                                                  //     width: 55,
                                                  child: Text(
                                                    "${ditails3[index].name3}",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "AirbnbCereal_W_Bk",
                                                        fontSize: 16,
                                                        color: notifire
                                                            .textshscreenprimerycolor),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 10, right: 15),
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
                                                        const EdgeInsets.only(
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
                                              margin: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 10),
                                              height: 50,
                                              width: 290,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff00AB67),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              child: const Center(
                                                  child: Text(
                                                "Add to Cart",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                        "AirbnbCereal_W_Md",
                                                    color: Colors.white),
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
                            margin: const EdgeInsets.only(left: 30),
                            height: 128,
                            width: 120,
                            child: Image.asset(
                              "${ditails3[index].image1}",
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 28, right: 28),
                            height: 30,
                            width: 132,
                            child: Text(
                              "${ditails3[index].name1}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "AirbnbCereal_W_Md",
                                  color: notifire.textshscreenprimerycolor),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 28, right: 28),
                            height: 20,
                            width: 132,
                            child: Text(
                              "${ditails3[index].name2}",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  fontSize: 12,
                                  color: notifire.mintextscreenprimerycolor),
                            ),
                          ),
                          Row(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 28),
                              height: 30,
                              //     width: 55,
                              child: Text(
                                "${ditails3[index].name3}",
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    fontSize: 16,
                                    color: notifire.textshscreenprimerycolor),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 10, right: 15),
                              height: 20,
                              width: 19,
                              child: Text("/er",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Bk",
                                      color:
                                          notifire.mintextscreenprimerycolor)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 35),
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/plus1.png",
                                fit: BoxFit.cover,
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const []);
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
    // print("index--->$index");
    // print("currentIndex--->$_currentPage");

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

class List4 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List4({this.image1, this.name1, this.name2, this.name3});
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

class List5 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List5({this.image1, this.name1, this.name2, this.name3});
}

class Slid {
  String image;

  Slid(this.image);
}
