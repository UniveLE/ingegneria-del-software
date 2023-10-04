// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Vegetable extends StatefulWidget {
  const Vegetable({Key? key}) : super(key: key);

  @override
  State<Vegetable> createState() => _VegetableState();
}

class _VegetableState extends State<Vegetable> {
  @override
  void initState() {
    super.initState();

    super.initState();
  }

  bool selectedcar = true;
  bool selectedmotorcycle = false;
  bool selectedtruck = false;
  int currentIndex = 0;
  late PageController _controller;
  List<String> slide = [
    "assets/logo/slide_1.png",
    "assets/logo/slide_2.png",
    "assets/logo/slide_3.png"
  ];
  List<List1> ditails = [
    List1(
        image1: "assets/veg1.png",
        name1: "Brocoli",
        name2: "approx 0.6lb",
        name3: "\$1.29"),
    List1(
        image1: "assets/veg2.png",
        name1: "Cobbage",
        name2: "approx 6oz",
        name3: "\$3.49"),
    List1(
        image1: "assets/veg3.png",
        name1: "Carrot",
        name2: "approx 1lb",
        name3: "\$2.49"),
    List1(
        image1: "assets/veg4.png",
        name1: "Corn",
        name2: "4ct, approx 2lb",
        name3: "\$5.99"),
    List1(
        image1: "assets/veg5.png",
        name1: "Pepper",
        name2: "approx 1oz",
        name3: "\$0.49"),
    List1(
        image1: "assets/veg6.png",
        name1: "Potato",
        name2: "approx 3lb bag",
        name3: "\$6.99"),
  ];
  int cnt = 0;
  bool all = false;
  bool you = true;
  bool artichoke = true;
  bool barcoli = true;
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
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 12),
                height: 10,
                child: Icon(Icons.arrow_back,
                    size: 20, color: notifire.textshscreenprimerycolor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  right: 160, left: 80, top: 8, bottom: 10),
              child: Center(
                child: Text(
                  "Vegetable",
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
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10),
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
                        hintText: "Search anything",
                        hintStyle: TextStyle(
                            color: notifire.mintextscreenprimerycolor,
                            fontSize: 14)
                        //  icon: Icon(Icons.search),
                        //  labelText: "user name"
                        ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 60),
                  child: const Icon(Icons.search, color: Color(0x0ffccccc)),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: notifire.topscreenprimerycolor,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      all = !true;
                      you = !false;
                      artichoke = !false;
                      barcoli = !false;
                      setState(() {});
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 28),
                      height: 40,
                      width: 55,
                      decoration: BoxDecoration(
                          color: all
                              ? notifire.spleshscreenprimerycolor
                              : Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: all ? Colors.black12 : Colors.green,
                              width: 1)),
                      child: Center(
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              color: all
                                  ? notifire.mintextscreenprimerycolor
                                  : Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      all = !false;
                      you = !true;
                      artichoke = !false;
                      barcoli = !false;
                      setState(() {});
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 16),
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: you
                              ? notifire.spleshscreenprimerycolor
                              : Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: you ? Colors.black12 : Colors.green,
                              width: 1)),
                      child: Center(
                        child: Text(
                          "For You",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              color: you
                                  ? notifire.mintextscreenprimerycolor
                                  : Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      all = !false;
                      you = !false;
                      artichoke = !true;
                      barcoli = !false;
                      setState(() {});
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 16),
                      height: 40,
                      width: 77,
                      decoration: BoxDecoration(
                          color: artichoke
                              ? notifire.spleshscreenprimerycolor
                              : Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: artichoke ? Colors.black12 : Colors.green,
                              width: 1)),
                      child: Center(
                        child: Text(
                          "Artichoke",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              color: artichoke
                                  ? notifire.mintextscreenprimerycolor
                                  : Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      all = !false;
                      you = !false;
                      artichoke = !false;
                      barcoli = !true;
                      setState(() {});
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 16),
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: barcoli
                              ? notifire.spleshscreenprimerycolor
                              : Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: barcoli ? Colors.black12 : Colors.green,
                              width: 1)),
                      child: Center(
                        child: Text(
                          "Broccoli",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              color: barcoli
                                  ? notifire.mintextscreenprimerycolor
                                  : Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            //  margin: EdgeInsets.only(top: 10),
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
              itemCount: ditails.length,
              addRepaintBoundaries: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: notifire.topscreenprimerycolor)),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  // building page indicator
}

class List1 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List1({this.image1, this.name1, this.name2, this.name3});
}

class Slid {
  String image;

  Slid(this.image);
}
