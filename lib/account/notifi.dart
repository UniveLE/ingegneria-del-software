// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifi extends StatefulWidget {
  const Notifi({Key? key}) : super(key: key);

  @override
  State<Notifi> createState() => _NotifiState();
}

class _NotifiState extends State<Notifi> {
  bool light = true;
  bool lighta = true;
  bool noti = false;
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
                  left: 105, right: 130, top: 8, bottom: 10),
              child: Center(
                child: Text(
                  "Notification",
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 50,
            width: 375,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 28, top: 10, bottom: 10),
                  height: 30,
                  width: 250,
                  child: Text(
                    "App Notification",
                    style: TextStyle(
                        fontFamily: "AirbnbCereal_W_Md",
                        fontSize: 14,
                        color: notifire.textshscreenprimerycolor),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    height: 30,
                    width: 50,
                    child: FlutterSwitch(
                        borderRadius: 15,
                        activeColor: const Color(0xff00AB67),
                        height: 30,
                        width: 50,
                        activeToggleColor: Colors.white,
                        value: light,
                        onToggle: (value) {
                          setState(() {
                            light = value;
                          });
                        }))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 50,
            width: 375,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 28, top: 10, bottom: 10),
                  height: 30,
                  width: 250,
                  child: Text(
                    "Email Notification",
                    style: TextStyle(
                        fontFamily: "AirbnbCereal_W_Md",
                        fontSize: 14,
                        color: notifire.textshscreenprimerycolor),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    height: 30,
                    width: 50,
                    child: FlutterSwitch(
                        borderRadius: 15,
                        activeColor: const Color(0xff00AB67),
                        height: 30,
                        width: 50,
                        activeToggleColor: Colors.white,
                        value: lighta,
                        onToggle: (value) {
                          setState(() {
                            lighta = value;
                          });
                        }))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 50,
            width: 375,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 28, top: 10, bottom: 10),
                  height: 30,
                  width: 250,
                  child: Text(
                    "SMS Notification",
                    style: TextStyle(
                        fontFamily: "AirbnbCereal_W_Md",
                        fontSize: 14,
                        color: notifire.textshscreenprimerycolor),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    height: 30,
                    width: 50,
                    child: FlutterSwitch(
                        borderRadius: 15,
                        activeColor: const Color(0xff00AB67),
                        height: 30,
                        width: 50,
                        activeToggleColor: Colors.white,
                        value: noti,
                        onToggle: (value) {
                          setState(() {
                            noti = value;
                          });
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
