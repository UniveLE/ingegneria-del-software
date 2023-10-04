// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editpro extends StatefulWidget {
  const Editpro({Key? key}) : super(key: key);

  @override
  State<Editpro> createState() => _EditproState();
}

class _EditproState extends State<Editpro> {
  TextEditingController dateinput = TextEditingController();

  //final ImagePicker _picker = ImagePicker();
  //String imagepath = "";
  String gen = "male";
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
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  // final ImagePicker _picker = ImagePicker();
  String imagepath = "";

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
                  left: 105, right: 140, top: 8, bottom: 10),
              child: Center(
                child: Text(
                  "Edit Profile",
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
      body: const SingleChildScrollView(),
    );
  }
}
