// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/bottombar.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Paymentcart extends StatefulWidget {
  const Paymentcart({Key? key}) : super(key: key);

  @override
  State<Paymentcart> createState() => _PaymentcartState();
}

class _PaymentcartState extends State<Paymentcart> {
  bool dis = false;
  bool isChecked = false;
  TextEditingController dateinput = TextEditingController();
  late Colornotifire notifire;
  String payment = "Cash On Delivery";

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
              margin: const EdgeInsets.only(top: 8, bottom: 10),
              height: 10,
              child: Icon(Icons.arrow_back,
                  size: 20, color: notifire.textshscreenprimerycolor),
            ),
          ),
          title: Text(
            "Payment Method",
            style: TextStyle(
                fontSize: 14,
                color: notifire.textshscreenprimerycolor,
                fontFamily: "AirbnbCereal_W_Bd"),
          ),
          centerTitle: true,
        ),
        backgroundColor: notifire.topscreenprimerycolor,
        body: const SingleChildScrollView());
  }
}
