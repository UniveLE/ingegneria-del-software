// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/order_/o_ditail.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Allo extends StatefulWidget {
  const Allo({Key? key}) : super(key: key);

  @override
  State<Allo> createState() => _AlloState();
}

class _AlloState extends State<Allo> {
  List<List5> ids = [
    List5(
        ids1: "GC092921", ids2: "GC092922", ids3: "GC092923", ids4: "PG080521"),
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

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.topscreenprimerycolor,
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: notifire.topscreenprimerycolor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 150,
              width: 355,
              color: notifire.spleshscreenprimerycolor,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Oditail();
                          },
                        ));
                      },
                      child: Column(children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15, top: 20),
                              height: 30,
                              width: 93,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xffFF3B3B).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  "CONFIRMED",
                                  style: TextStyle(
                                      fontFamily: "AirbnbCereal_W_Md",
                                      color: Color(0xffFF3B3B),
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 80, top: 20),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xffFF3B3B).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(Icons.check_outlined,
                                  color: Color(0xffFF3B3B)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, top: 20),
                              padding: const EdgeInsets.all(7),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          notifire.mintextscreenprimerycolor)),
                              child: Image.asset(
                                "assets/logo/i_1.png",
                                color: notifire.mintextscreenprimerycolor,
                                width: 12,
                                height: 12,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 5, top: 20),
                                padding: const EdgeInsets.all(7),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: notifire
                                            .mintextscreenprimerycolor)),
                                child: Image.asset(
                                  "assets/logo/i_2.png",
                                  color: notifire.mintextscreenprimerycolor,
                                )),
                            Container(
                                margin: const EdgeInsets.only(left: 5, top: 20),
                                padding: const EdgeInsets.all(7),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: notifire
                                            .mintextscreenprimerycolor)),
                                child: Image.asset(
                                  "assets/logo/i_3.png",
                                  color: notifire.mintextscreenprimerycolor,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 33, left: 28),
                                  height: 20,
                                  width: 81,
                                  child: Text(
                                    "Order ID",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "AirbnbCereal_W_Bk",
                                        color:
                                            notifire.mintextscreenprimerycolor),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: ids.length,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text("${ids[index].ids1}",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "AirbnbCereal_W_Md",
                                                    color: notifire
                                                        .textshscreenprimerycolor,
                                                    fontSize: 14)),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 33, left: 28),
                                  height: 20,
                                  width: 81,
                                  child: Text(
                                    "Deliver To",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "AirbnbCereal_W_Bk",
                                        color:
                                            notifire.mintextscreenprimerycolor),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 70,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: ids.length,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text("Home",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "AirbnbCereal_W_Md",
                                                    color: notifire
                                                        .textshscreenprimerycolor,
                                                    fontSize: 14)),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                            Column(children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 33, left: 28),
                                height: 20,
                                width: 81,
                                child: Text(
                                  "Total Payment",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AirbnbCereal_W_Bk",
                                      color:
                                          notifire.mintextscreenprimerycolor),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 70,
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: ids.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 30,
                                        child: Center(
                                          child: Text("\$23.98",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "AirbnbCereal_W_Md",
                                                  color: notifire
                                                      .textshscreenprimerycolor,
                                                  fontSize: 14)),
                                        ),
                                      );
                                    }),
                              ),
                            ]),
                          ],
                        ),
                      ]),
                    );
                  }),
            ),
          ),
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: notifire.topscreenprimerycolor,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Oditail();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  color: notifire.spleshscreenprimerycolor,
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16, top: 20),
                          height: 30,
                          width: 93,
                          decoration: BoxDecoration(
                              color: const Color(0xffFFC62B).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              "ON PROCESS",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Md",
                                  color: Color(0xffFFC62B),
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 80, top: 20),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF3B3B).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(Icons.check_outlined,
                              color: Color(0xffFF3B3B)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5, top: 20),
                          padding: const EdgeInsets.all(7),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFC62B).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/logo/i_1.png",
                            color: const Color(0xffFFC62B),
                            width: 12,
                            height: 12,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 5, top: 20),
                            padding: const EdgeInsets.all(7),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: notifire.mintextscreenprimerycolor)),
                            child: Image.asset(
                              "assets/logo/i_2.png",
                              color: notifire.mintextscreenprimerycolor,
                            )),
                        Container(
                            margin: const EdgeInsets.only(left: 5, top: 20),
                            padding: const EdgeInsets.all(7),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: notifire.mintextscreenprimerycolor)),
                            child: Image.asset(
                              "assets/logo/i_3.png",
                              color: notifire.mintextscreenprimerycolor,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 33, left: 28),
                              height: 20,
                              width: 81,
                              child: Text(
                                "Order ID",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    color: notifire.mintextscreenprimerycolor),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 80,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ids.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text("${ids[index].ids2}",
                                            style: TextStyle(
                                                fontFamily: "AirbnbCereal_W_Md",
                                                color: notifire
                                                    .textshscreenprimerycolor,
                                                fontSize: 14)),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 33, left: 28),
                              height: 20,
                              width: 81,
                              child: Text(
                                "Deliver To",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    color: notifire.mintextscreenprimerycolor),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 70,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ids.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text("Office",
                                            style: TextStyle(
                                                fontFamily: "AirbnbCereal_W_Md",
                                                color: notifire
                                                    .textshscreenprimerycolor,
                                                fontSize: 14)),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Column(children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 28),
                            height: 20,
                            width: 81,
                            child: Text(
                              "Total Payment",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  color: notifire.mintextscreenprimerycolor),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 70,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ids.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: Text("\$60.32",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Md",
                                              color: notifire
                                                  .textshscreenprimerycolor,
                                              fontSize: 14)),
                                    ),
                                  );
                                }),
                          ),
                        ]),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              )),
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: notifire.topscreenprimerycolor,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Oditail();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  color: notifire.spleshscreenprimerycolor,
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 20),
                          height: 30,
                          width: 93,
                          decoration: BoxDecoration(
                              color: const Color(0xff00AB67).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              "SHIPPED",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Md",
                                  color: Color(0xff00AB67),
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 80, top: 20),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF3B3B).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(Icons.check_outlined,
                              color: Color(0xffFF3B3B)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5, top: 20),
                          padding: const EdgeInsets.all(7),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFC62B).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/logo/i_1.png",
                            color: const Color(0xffFFC62B),
                            width: 12,
                            height: 12,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 5, top: 20),
                            padding: const EdgeInsets.all(7),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xff00AB67).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset("assets/logo/i_2.png",
                                color: const Color(0xff00AB67))),
                        Container(
                            margin: const EdgeInsets.only(left: 5, top: 20),
                            padding: const EdgeInsets.all(7),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: notifire.mintextscreenprimerycolor)),
                            child: Image.asset(
                              "assets/logo/i_3.png",
                              color: notifire.mintextscreenprimerycolor,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 33, left: 28),
                              height: 20,
                              width: 81,
                              child: Text(
                                "Order ID",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    color: notifire.mintextscreenprimerycolor),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 80,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ids.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const Oditail();
                                          },
                                        ));
                                      },
                                      child: SizedBox(
                                        height: 30,
                                        child: Center(
                                          child: Text("${ids[index].ids3}",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "AirbnbCereal_W_Md",
                                                  color: notifire
                                                      .textshscreenprimerycolor,
                                                  fontSize: 14)),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 33, left: 28),
                              height: 20,
                              width: 81,
                              child: Text(
                                "Deliver To",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "AirbnbCereal_W_Bk",
                                    color: notifire.mintextscreenprimerycolor),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 70,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ids.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text("Mother",
                                            style: TextStyle(
                                                fontFamily: "AirbnbCereal_W_Md",
                                                color: notifire
                                                    .textshscreenprimerycolor,
                                                fontSize: 14)),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Column(children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 28),
                            height: 20,
                            width: 81,
                            child: Text(
                              "Total Payment",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  color: notifire.mintextscreenprimerycolor),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 70,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ids.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: Text("\$25.45",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Md",
                                              color: notifire
                                                  .textshscreenprimerycolor,
                                              fontSize: 14)),
                                    ),
                                  );
                                }),
                          ),
                        ]),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
                ),
              )),
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: notifire.topscreenprimerycolor,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Oditail();
                },
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                color: notifire.spleshscreenprimerycolor,
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15, top: 20),
                        height: 30,
                        width: 93,
                        decoration: BoxDecoration(
                            color: const Color(0xff0067FF).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "DELIVERED",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                color: Color(0xff0067FF),
                                fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 80, top: 20),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: const Color(0xffFF3B3B).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(Icons.check_outlined,
                            color: Color(0xffFF3B3B)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5, top: 28),
                        padding: const EdgeInsets.all(7),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFC62B).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/logo/i_1.png",
                          color: const Color(0xffFFC62B),
                          width: 12,
                          height: 12,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 5, top: 20),
                          padding: const EdgeInsets.all(7),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xff00AB67).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset("assets/logo/i_2.png",
                              color: const Color(0xff00AB67))),
                      Container(
                          margin: const EdgeInsets.only(left: 5, top: 20),
                          padding: const EdgeInsets.all(7),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xff0067FF).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/logo/i_3.png",
                            color: const Color(0xff0067FF),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 28),
                            height: 20,
                            width: 81,
                            child: Text(
                              "Order ID",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  color: notifire.mintextscreenprimerycolor),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 80,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ids.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: Text("${ids[index].ids4}",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Md",
                                              color: notifire
                                                  .textshscreenprimerycolor,
                                              fontSize: 14)),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 28),
                            height: 20,
                            width: 81,
                            child: Text(
                              "Deliver To",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  color: notifire.mintextscreenprimerycolor),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 70,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ids.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: Text("My Home",
                                          style: TextStyle(
                                              fontFamily: "AirbnbCereal_W_Md",
                                              color: notifire
                                                  .textshscreenprimerycolor,
                                              fontSize: 14)),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                      Column(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 33, left: 28),
                          height: 20,
                          width: 81,
                          child: Text(
                            "Total Payment",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "AirbnbCereal_W_Bk",
                                color: notifire.mintextscreenprimerycolor),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 70,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: ids.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Text("\$25.45",
                                        style: TextStyle(
                                            fontFamily: "AirbnbCereal_W_Md",
                                            color: notifire
                                                .textshscreenprimerycolor,
                                            fontSize: 14)),
                                  ),
                                );
                              }),
                        ),
                      ]),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]),
              ),
            ),
          )
        ])));
  }
}

class List5 {
  String? ids1;
  String? ids2;
  String? ids3;
  String? ids4;

  List5({this.ids1, this.ids2, this.ids3, this.ids4});
}
