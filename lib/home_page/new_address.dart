// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/home_page/map.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Newaddress extends StatefulWidget {
  const Newaddress({Key? key}) : super(key: key);

  @override
  State<Newaddress> createState() => _NewaddressState();
}

class _NewaddressState extends State<Newaddress> {
  late Colornotifire notifire;
  bool isChecked = false;
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
        //   resizeToAvoidBottomInset: false,
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const Map();
              },
            ));
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10, left: 20, bottom: 15),
            height: 60,
            width: 319,
            decoration: BoxDecoration(
                color: const Color(0xff00AB67),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
                child: Text(
              "Pick Location",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AirbnbCereal_W_Bk",
                  color: Colors.white),
            )),
          ),
        ),
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
            "Add New Address",
            style: TextStyle(
                fontSize: 14,
                color: notifire.textshscreenprimerycolor,
                fontFamily: "AirbnbCereal_W_Bd"),
          ),
          centerTitle: true,
        ),
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: const SingleChildScrollView());
  }
}
