// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Photo extends StatefulWidget {
  List ditails;
  int index;
  List<String> slide;

  Photo(this.ditails, this.index, this.slide, {Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  Navigator.pop(context);
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
                    right: 150, left: 100, top: 8, bottom: 10),
                child: Center(
                  child: Text(
                    "All Images",
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
          child: Column(children: [
            const Center(),
            const SizedBox(
              height: 140,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.slide.length,
                (index) => buildDot(index, context),
              ),
            ),
          ]),
        ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
        height: 6,
        width: currentIndex == index ? 25 : 8,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (index == currentIndex)
                ? Colors.blueAccent
                : Colors.grey.withOpacity(0.2)));
  }
}
