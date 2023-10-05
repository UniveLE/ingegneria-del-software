// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  List<String> slide = [
    "assets/logo/slide_1.png",
    "assets/logo/slide_2.png",
    "assets/logo/slide_3.png"
  ];
  int cnt = 0;

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

  List<List4> ditails3 = [
    List4(
        image1: "assets/kiwi.png",
        name1: "Kiwifruit",
        name2: "approx 0.25lb",
        name3: "\$0.89"),
    List4(
        image1: "assets/cobbage1.png",
        name1: "Cobbage",
        name2: "approx 2lb",
        name3: "\$3.49"),
    List4(
        image1: "assets/crad.png",
        name1: "Crab",
        name2: "6ct | \$4.50/ct",
        name3: "\$26.9"),
    List4(
        image1: "assets/almond.png",
        name1: "Almond",
        name2: "16oz | \$8.99/lb",
        name3: "\$8.99"),
    List4(
        image1: "assets/pasta.png",
        name1: "Pasta",
        name2: "19oz | \$4.91/lb",
        name3: "\$3.49"),
    List4(
        image1: "assets/beef.png",
        name1: "Beef Chuck Stew",
        name2: "12 - 14ct/lb",
        name3: "\$26.99"),
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 680,
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
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(left: 30),
                            height: 128,
                            width: 120,
                            child: Image.asset(
                              "${ditails3[index].image1}",
                            ),
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
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter
                                            setState /*You can rename this!*/) {
                                  return SizedBox(
                                      child: SingleChildScrollView(
                                          child: Column(children: [
                                    Container(
                                        margin: const EdgeInsets.only(top: 70),
                                        height: 559,
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
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF2FBF7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: PageView.builder(
                                                    itemCount: slide.length,
                                                    itemBuilder: (_, i) {
                                                      return Column(children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 20,
                                                                      right:
                                                                          20),
                                                              height: 270,
                                                              width: 270,
                                                              //color: Colors.blueAccent,
                                                              child: Image.asset(
                                                                  "${ditails3[index].image1}"),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Center(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            130,
                                                                        right:
                                                                            120),
                                                                height: 8,
                                                                width: 46,
                                                                child:
                                                                    Image.asset(
                                                                  slide[i],
                                                                  color: Colors
                                                                      .black87,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ]);
                                                    }),
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
                                                      margin:
                                                          const EdgeInsets.only(
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
                                                      margin:
                                                          const EdgeInsets.only(
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
                                              )
                                            ])
                                          ])
                                        ]))
                                  ])));
                                });
                              },
                            );
                          },
                          child: Row(children: [
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
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
        ));
  }
}

class List4 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List4({this.image1, this.name1, this.name2, this.name3});
}
