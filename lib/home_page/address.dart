// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/home_page/new_address.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  late Colornotifire notifire;
  bool box = false;
  bool address = true;
  bool cheack = true;
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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
              size: 20, color: notifire.textshscreenprimerycolor),
        ),
        title: Text(
          "Address List",
          style: TextStyle(
              fontSize: 14,
              color: notifire.textshscreenprimerycolor,
              fontFamily: "AirbnbCereal_W_Bd"),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Newaddress();
                },
              ));
            },
            child: Icon(
              Icons.add,
              color: notifire.textshscreenprimerycolor,
            ),
          ),
          const SizedBox(
            width: 15,
          )
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
                          hintText: "Search in address list",
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
                    child: const Icon(Icons.search, color: Color(0xffCCCCCC)),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                box = !true;
                address = !false;
                cheack = !false;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 28, right: 28),
                height: 248,
                width: 319,
                decoration: BoxDecoration(
                    color: box
                        ? notifire.spleshscreenprimerycolor
                        : const Color(0xff00AB67).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: box
                            ? notifire.topscreenprimerycolor
                            : const Color(0xff00AB67),
                        width: 2)),
                child: Column(children: [
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 28, horizontal: 15)),
                      Text(
                        "HOME",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            fontSize: 12,
                            color: notifire.textshscreenprimerycolor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 20,
                        width: 72,
                        decoration: BoxDecoration(
                            color: const Color(0xff00AB67),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            "MAIN ADDRESS",
                            style: TextStyle(
                                fontSize: 8,
                                fontFamily: "AirbnbCereal_W_Md",
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            color: const Color(0xff00AB67),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  // SizedBox(width: 20,),
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10)),
                      Text(
                        "Susan J. Patterson   •",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor),
                      ),
                      Center(
                          child: Text(
                        "  714 430 2816",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor),
                      ))
                    ],
                  ),
                  // Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 88),
                    child: Text("4467 Grand Steve Hunt Road",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 131),
                    child: Text("Miami, Florida 33143",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor)),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 25, top: 60),
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                            // color: Color(0xff00AB67).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1,
                                color: notifire.mintextscreenprimerycolor)),
                        child: Center(
                          child: Text(
                            "Edit Address",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                fontSize: 12,
                                color: notifire.textshscreenprimerycolor),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25, top: 60),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            // color: Color(0xff00AB67).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1,
                                color: notifire.mintextscreenprimerycolor)),
                        child: Center(
                            child: Icon(Icons.more_horiz,
                                color: notifire.textshscreenprimerycolor)),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                box = !false;
                address = !true;
                cheack = !false;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 28, right: 28),
                height: 248,
                width: 319,
                decoration: BoxDecoration(
                    color: address
                        ? notifire.spleshscreenprimerycolor
                        : const Color(0xff00AB67).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: address
                            ? notifire.topscreenprimerycolor
                            : const Color(0xff00AB67),
                        width: 2)),
                child: Column(children: [
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 28, horizontal: 15)),
                      Text(
                        "OFFICE",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            fontSize: 12,
                            color: notifire.textshscreenprimerycolor),
                      ),
                    ],
                  ),
                  // SizedBox(width: 20,),
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10)),
                      Text(
                        "Rosanna W Scott    •",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor),
                      ),
                      Center(
                          child: Text(
                        "  874 264 4684",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor),
                      ))
                    ],
                  ),
                  // Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 88),
                    child: Text("4467 Grand Steve Hunt Road",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 131),
                    child: Text("Miami, Florida 33143",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor)),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 25, top: 60),
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                            // color: Color(0xff00AB67).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1,
                                color: notifire.mintextscreenprimerycolor)),
                        child: Center(
                          child: Text(
                            "Edit Address",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                fontSize: 12,
                                color: notifire.textshscreenprimerycolor),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25, top: 60),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            // color: Color(0xff00AB67).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1,
                                color: notifire.mintextscreenprimerycolor)),
                        child: Center(
                            child: Icon(Icons.more_horiz,
                                color: notifire.textshscreenprimerycolor)),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                box = !false;
                address = !false;
                cheack = !true;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 28, right: 28),
                height: 248,
                width: 319,
                decoration: BoxDecoration(
                    color: cheack
                        ? notifire.spleshscreenprimerycolor
                        : const Color(0xff00AB67).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: cheack
                            ? notifire.topscreenprimerycolor
                            : const Color(0xff00AB67),
                        width: 2)),
                child: Column(children: [
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 28, horizontal: 15)),
                      Text(
                        "MOTHER’S HOME",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            fontSize: 12,
                            color: notifire.textshscreenprimerycolor),
                      ),
                    ],
                  ),
                  // SizedBox(width: 20,),
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10)),
                      Text(
                        "Rosanna W Scott    •",
                        style: TextStyle(
                            fontFamily: "AirbnbCereal_W_Md",
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor),
                      ),
                      Center(
                          child: Text(
                        "  874 264 4684",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor),
                      ))
                    ],
                  ),
                  // Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 88),
                    child: Text("4467 Grand Steve Hunt Road",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 131),
                    child: Text("Miami, Florida 33143",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AirbnbCereal_W_Md",
                            color: notifire.mintextscreenprimerycolor)),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 25, top: 60),
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                            // color: Color(0xff00AB67).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1,
                                color: notifire.mintextscreenprimerycolor)),
                        child: Center(
                          child: Text(
                            "Edit Address",
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                fontSize: 12,
                                color: notifire.textshscreenprimerycolor),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25, top: 60),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            // color: Color(0xff00AB67).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1,
                                color: notifire.mintextscreenprimerycolor)),
                        child: Center(
                            child: Icon(Icons.more_horiz,
                                color: notifire.textshscreenprimerycolor)),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
