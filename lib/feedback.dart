// ignore_for_file: file_names
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/order_/o_ditail.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Feedbacks extends StatefulWidget {
  const Feedbacks({Key? key}) : super(key: key);

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  List? get ids => null;
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Oditail();
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
                  right: 130, top: 8, left: 90, bottom: 10),
              child: Center(
                child: Text(
                  "Write a Review",
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25, top: 10, right: 20),
              height: 130,
              width: 310,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(
                          "assets/panipuri.jpg",
                        ))),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, top: 20, right: 100),
                        child: Text(
                          "Puchka",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Bd",
                              color: notifire.textshscreenprimerycolor,
                              fontSize: 17),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, top: 10),
                        width: 170,
                        height: 40,
                        child: Text(
                          "soft corn tacos of achiote rubbed mahi",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.mintextscreenprimerycolor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, right: 160, left: 20),
              child: Text(
                "Add Photo or Video",
                style: TextStyle(
                    fontFamily: "AirbnbCereal_W_Bd",
                    fontSize: 17,
                    color: notifire.textshscreenprimerycolor),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              color: Colors.grey,
              padding: const EdgeInsets.only(left: 20, right: 20),
              radius: const Radius.circular(12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  width: 270,
                  height: 150,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 150,
                        child: Image.asset("assets/logo/upload.png",
                            color: Colors.green),
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: Text(
                          "Click here to upload",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "AirbnbCereal_W_Md",
                              color: notifire.mintextscreenprimerycolor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, right: 170, left: 20),
              child: Text(
                "Write Yor Review",
                style: TextStyle(
                    fontFamily: "AirbnbCereal_W_Bd",
                    fontSize: 17,
                    color: notifire.textshscreenprimerycolor),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              color: Colors.grey,
              padding: const EdgeInsets.only(left: 20, right: 20),
              radius: const Radius.circular(12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  width: 270,
                  height: 150,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 250,
                        child: TextField(
                          maxLines: 6,
                          decoration: InputDecoration(
                              // counterText: "350 characters remaining",
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText:
                                  "Would you like to write anything about this product ?",
                              hintStyle: TextStyle(
                                  color: notifire.mintextscreenprimerycolor,
                                  fontSize: 14)
                              //  labelText: "user name"
                              ),
                        ),
                        // child: TextFormField(
                        //   // controller:Phonenumber ,
                        //   decoration: InputDecoration(
                        //       disabledBorder: InputBorder.none,
                        //       focusedBorder: InputBorder.none,
                        //       enabledBorder: InputBorder.none,
                        //       hintText: "Would you like to write anything about this product ?",
                        //       hintStyle: TextStyle(color: notifire.mintextscreenprimerycolor,fontSize: 14)
                        //     //  labelText: "user name"
                        //   ),
                        // ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 25),
              height: 20,
              child: const TextField(
                  maxLines: 6,
                  decoration: InputDecoration(
                    counterText: "350 characters remaining",
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  )
                  //  labelText: "user name"
                  ),
            ),
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
                  margin: const EdgeInsets.only(top: 60, bottom: 15),
                  height: 60,
                  width: 319,
                  decoration: BoxDecoration(
                      color: const Color(0xff00AB67),
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    "Submit Review",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "AirbnbCereal_W_Bd"),
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
