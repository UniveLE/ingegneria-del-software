// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helpcentre extends StatefulWidget {
  const Helpcentre({Key? key}) : super(key: key);

  @override
  State<Helpcentre> createState() => _HelpcentreState();
}

class _HelpcentreState extends State<Helpcentre> {
  TextEditingController search = TextEditingController();
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
        automaticallyImplyLeading: true,
        backgroundColor: notifire.spleshscreenprimerycolor,
        leading: BackButton(
          color: notifire.textshscreenprimerycolor,
        ),
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Help Centre',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: notifire.textshscreenprimerycolor),
            ),
          ],
        ),
      ),
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: SizedBox(
                height: 25,
                width: 327,
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 28,
                        ),
                        child: Image(
                            image: const AssetImage('assets/logo/search_1.png'),
                            color: notifire.textshscreenprimerycolor,
                            width: 14.25,
                            height: 14.25),
                      ),
                    ),
                    suffixIcon: SizedBox(
                      height: 80,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 2),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image(
                              image:
                                  const AssetImage('assets/logo/setting.png'),
                              color: notifire.textshscreenprimerycolor,
                              width: 18,
                              height: 18),
                        ),
                      ),
                    ),
                    hintText: 'Have a question?',
                    hintStyle: TextStyle(
                        fontFamily: 'Gilroy',
                        color: notifire.mintextscreenprimerycolor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Divider(
                thickness: 1,
                color: notifire.mintextscreenprimerycolor,
              ),
            ),
            ExpansionTile(
              iconColor: notifire.textshscreenprimerycolor,
              collapsedIconColor: notifire.textshscreenprimerycolor,
              title: Text(
                "Data Privacy",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: notifire.textshscreenprimerycolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ), //header title
              children: [
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(
                      "Hanukkah is observed for eight nights and days, starting on the 25th day of Kislev according to the Hebrew calendar,"
                      " which may occur at any time from late November to late December in the Gregorian calendar.",
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: notifire.textshscreenprimerycolor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
            ExpansionTile(
              iconColor: notifire.textshscreenprimerycolor,
              collapsedIconColor: notifire.textshscreenprimerycolor,
              title: Text(
                "About Promo",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: notifire.textshscreenprimerycolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ), //header title
              children: [
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(
                      "Hanukkah is observed for eight nights and days, starting on the 25th day of Kislev according to the Hebrew calendar,"
                      " which may occur at any time from late November to late December in the Gregorian calendar.",
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: notifire.textshscreenprimerycolor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
            ExpansionTile(
              iconColor: notifire.textshscreenprimerycolor,
              collapsedIconColor: notifire.textshscreenprimerycolor,
              title: Text(
                "Application Problems",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: notifire.textshscreenprimerycolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ), //header title
              children: [
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt. "
                      "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt\n\n"
                      "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt",
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: notifire.textshscreenprimerycolor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
            ExpansionTile(
              iconColor: notifire.textshscreenprimerycolor,
              collapsedIconColor: notifire.textshscreenprimerycolor,
              title: Text(
                "Give Feedback",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: notifire.textshscreenprimerycolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ), //header title
              children: [
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(
                      "Hanukkah is observed for eight nights and days, starting on the 25th day of Kislev according to the Hebrew calendar,"
                      " which may occur at any time from late November to late December in the Gregorian calendar.",
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: notifire.textshscreenprimerycolor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
