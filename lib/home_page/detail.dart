// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:myfoodtracker/home_page/photo.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget {
  List ditails;
  List<String> slide;
  int index;

  Detail(this.ditails, this.index, this.slide, {Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
  // List<Slid> _slides = [];
  // PageController _pageController = PageController();
  //
  // void initState() {
  //   super.initState();
  //   _currentPage = 0;
  //   _slides = [
  //     Slid("assets/veg1.png"),
  //     Slid("assets/veg1.png"),
  //     Slid("assets/veg1.png"),
  //   ];
  //   _pageController = PageController(initialPage: _currentPage);
  //   super.initState();
  // }

  // int _currentPage = 0;
  // int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _slides = [
      Slide("assets/veg1.png"),
      Slide("assets/veg1.png"),
      Slide("assets/veg1.png"),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  int _currentPage = 0;
  List<Slide> _slides = [];

  PageController _pageController = PageController();

  // the list which contain the build slides
  // List<Widget> _buildSlides() {
  //   return _slides.map(_buildSlide).toList();
  // }

  List<String> slide = [
    "assets/logo/slide_1.png",
    "assets/logo/slide_2.png",
    "assets/logo/slide_3.png"
  ];
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  Widget _buildSlide(Slide slide) {
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
                      slide.image,
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

  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
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
              ? const Color(0xff00AB67)
              : const Color(0xff00AB67).withOpacity(0.2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);

    return Scaffold(
        bottomNavigationBar: Row(
          children: [
            SizedBox(
              height: 90,
              child: Row(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 28, top: 20, bottom: 20),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 1, color: notifire.topscreenprimerycolor)),
                    child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Image.asset(
                          "assets/logo/like.png",
                          color: notifire.textshscreenprimerycolor,
                        )),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 28, top: 20, bottom: 20),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 1, color: notifire.topscreenprimerycolor)),
                    child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Image.asset(
                          "assets/logo/share.png",
                          color: notifire.textshscreenprimerycolor,
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Bottombar();
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                          color: const Color(0xff00AB67),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Center(
                          child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
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
                    right: 80, top: 8, left: 85, bottom: 10),
                child: const Center(
                  child: Text(
                    "Product Detail",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: "AirbnbCereal_W_Bd"),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Bottombar();
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 5, left: 10),
                  height: 40,
                  width: 40,
                  //    color: Colors.black,
                  child: Stack(children: [
                    SizedBox(
                      height: 16.5,
                      width: 16,
                      child: Image.asset(
                        "assets/logo/bag.png",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 9, bottom: 15),
                      height: 12,
                      width: 12,
                      child: Image.asset("assets/logo/Badge_1.png"),
                    )
                  ]),
                ),
              ),
            ]),
          ],
        ),
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: SingleChildScrollView(
            child: Column(children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Photo(widget.ditails, widget.index, widget.slide);
                },
              ));
            },
            // child: Container(
            //   height: 319,
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //       color: Color(0xffF2FBF7),
            //       borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(10),
            //           bottomRight: Radius.circular(10))),
            child: Column(children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 18, top: 20, right: 18),
                  height: 319,
                  width: 319,
                  child: Stack(
                    children: [
                      PageView(
                          controller: _pageController,
                          onPageChanged: _handlingOnPageChanged,
                          physics: const BouncingScrollPhysics(),
                          children: _buildSlides()),
                      Positioned(
                          bottom: 40, left: 130, child: _buildPageIndicator())
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                color: notifire.topscreenprimerycolor,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 90,
                    width: 375,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 28),
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/gf.png"),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 15, top: 30, right: 129),
                              height: 20,
                              width: 95,
                              child: Text(
                                "GrowFarm Inc",
                                style: TextStyle(
                                    color: notifire.textshscreenprimerycolor,
                                    fontSize: 14,
                                    fontFamily: "AirbnbCereal_W_Bd"),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 100),
                              height: 15,
                              width: 122,
                              child: Text(
                                "Downers Grove, Illiois",
                                style: TextStyle(
                                    color: notifire.mintextscreenprimerycolor,
                                    fontSize: 12,
                                    fontFamily: "AirbnbCereal_W_Bk"),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffF2FBF7),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(Icons.check_outlined,
                              color: Color(0xff00AB67)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                color: notifire.topscreenprimerycolor,
              ),
              Column(children: [
                SizedBox(
                  height: 150,
                  width: 375,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 28, top: 28, right: 240),
                        height: 30,
                        width: 95,
                        child: Text(
                          "DESCRIPTION",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.textshscreenprimerycolor),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 28, right: 28, top: 10),
                          child: ReadMoreText(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod. ",
                            trimLines: 2,
                            style: TextStyle(
                                color: notifire.mintextscreenprimerycolor,
                                fontSize: 14),
                            colorClickableText: Colors.blue,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read more',
                            trimExpandedText: ' Read less',
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  color: notifire.topscreenprimerycolor,
                )
              ]),
              Column(
                children: [
                  SizedBox(
                    height: 131,
                    width: 375,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 28, top: 28, right: 270),
                          height: 30,
                          width: 55,
                          child: Text(
                            "REVIEW",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                color: notifire.textshscreenprimerycolor,
                                fontSize: 14),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 28, right: 23, top: 10, bottom: 40),
                              height: 20,
                              width: 100,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 15,
                                    width: 15,
                                    child: const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 15,
                                    width: 15,
                                    child: const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 15,
                                    width: 15,
                                    child: const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 15,
                                    width: 15,
                                    child: const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 30, bottom: 10),
                              height: 30,
                              width: 127,
                              child: Text(
                                "5.0 from 496 buyer",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    color: notifire.mintextscreenprimerycolor),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                height: 10,
                                width: 6,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: notifire.mintextscreenprimerycolor,
                                  size: 15,
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                color: notifire.topscreenprimerycolor,
              )
            ]),
          )
        ])));
  }
}

// class List1 {
//   String? image1;
//   String? name1;
//   String? name2;
//   String? name3;
//
//   List1({this.image1, this.name1, this.name2, this.name3});
// }
class Slide {
  String image;

  Slide(
    this.image,
  );
}
