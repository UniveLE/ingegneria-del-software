// ignore_for_file: file_names
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:myfoodtracker/feedback.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Oditail extends StatefulWidget {
  const Oditail({Key? key}) : super(key: key);

  @override
  State<Oditail> createState() => _OditailState();
}

class _OditailState extends State<Oditail> {
  List<List1> ditails = [
    List1(
        image1: "assets/cabbage.png",
        name1: "Cabbage",
        name2: "Approx 6oz",
        name3: "\$3.49",
        name4: "\$5.98"),
    List1(
        image1: "assets/orrange.png",
        name1: "Mandarin",
        name2: "4ct, approx 2lb",
        name3: "\$2.99",
        name4: "\$5.98"),
    List1(
        image1: "assets/stew.png",
        name1: "Beef Chuck Stew",
        name2: "12-14ct/lb",
        name3: "\$7.99",
        name4: "\$15.98"),
  ];
  List<StepperData> stepperdata = [
    StepperData(
      iconWidget: Container(
        padding: const EdgeInsets.all(5),
        height: 30,
        width: 30,
        decoration: BoxDecoration(

            // color: Color(0xffFF3B3B).withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        child: const Icon(Icons.check_outlined, color: Color(0xffFF3B3B)),
      ),
      title: StepperText("Order Confirmed",
          textStyle: const TextStyle(
              color: Colors.black87,
              fontFamily: "AirbnbCereal_W_Md",
              fontSize: 14)),
      subtitle: StepperText(
          "Sep 29, 2021                                                      08.00 PM",
          textStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 12,
              fontFamily: "AirbnbCereal_W_Bk.otf")),
    ),
    StepperData(
        iconWidget: Container(
          padding: const EdgeInsets.all(5),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: const Color(0xffFFC62B).withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset(
            "assets/logo/i_1.png",
            color: const Color(0xffFFC62B),
            fit: BoxFit.cover,
            height: 10,
            width: 10,
          ),
        ),
        title: StepperText("Order on Process",
            textStyle: const TextStyle(
                color: Colors.black87,
                fontFamily: "AirbnbCereal_W_Md",
                fontSize: 14)),
        subtitle: StepperText(
            "Sep 30, 2021                                                      07.00 AM",
            textStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontFamily: "AirbnbCereal_W_Bk.otf"))),
    StepperData(
        iconWidget: Container(
            padding: const EdgeInsets.all(5),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: const Color(0xff00AB67).withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset("assets/logo/i_2.png",
                color: const Color(0xff00AB67))),
        title: StepperText("Order Shipped",
            textStyle: const TextStyle(
                color: Colors.black87,
                fontFamily: "AirbnbCereal_W_Md",
                fontSize: 14)),
        subtitle: StepperText(
            "Sep 30, 2021                                                      07.30 PM",
            textStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontFamily: "AirbnbCereal_W_Bk.otf"))),
    StepperData(
        iconWidget: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: const Color(0xff0067FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset("assets/logo/i_3.png",
                color: const Color(0xff0067FF))),
        title: StepperText("Order Delivered",
            textStyle: const TextStyle(
                color: Colors.black87,
                fontFamily: "AirbnbCereal_W_Md",
                fontSize: 14)),
        subtitle: StepperText(
            "Sep 30, 2021                                                       08.00 AM",
            textStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontFamily: "AirbnbCereal_W_Bk.otf")))
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
        appBar: AppBar(
          backgroundColor: notifire.spleshscreenprimerycolor,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 50,
          actions: [
            Row(children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Bottombar();
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 8, left: 20, right: 10, bottom: 20),
                  height: 8,
                  width: 10,
                  child: Icon(Icons.arrow_back,
                      size: 20, color: notifire.textshscreenprimerycolor),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 140, top: 8, left: 90, bottom: 10),
                child: Center(
                  child: Text(
                    "Order Detail",
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
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const Feedbacks();
              },
            ));
          },
          child: Container(
            margin:
                const EdgeInsets.only(left: 28, right: 28, bottom: 8, top: 18),
            height: 50,
            width: 80,
            decoration: BoxDecoration(
                color: const Color(0xff00AB67),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
                child: Text(
              "Write Feedback",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AirbnbCereal_W_Md",
                  color: Colors.white),
            )),
          ),
        ),
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: const SingleChildScrollView());
  }
}

class List1 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;
  String? name4;

  List1({this.image1, this.name1, this.name2, this.name3, this.name4});
}
