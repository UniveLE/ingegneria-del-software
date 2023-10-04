// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/notification/transection.dart';
import 'package:myfoodtracker/notification/update.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with TickerProviderStateMixin {
  late TabController _controller;
  late Colornotifire notifire;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<Widget> noti = const [
    Update(),
    Transection(),
  ];
  int selectindex = 0;
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: notifire.spleshscreenprimerycolor,
          automaticallyImplyLeading: false,
          toolbarHeight: 112,
          elevation: 0,
          actions: [
            Column(children: [
              Row(children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 17),
                    height: 10,
                    child: Icon(Icons.arrow_back,
                        size: 20, color: notifire.textshscreenprimerycolor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 100, left: 90, top: 20),
                  child: Center(
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 14,
                          color: notifire.textshscreenprimerycolor,
                          fontFamily: "AirbnbCereal_W_Bd"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                    top: 20,
                  ),
                  height: 18,
                  width: 15,
                  child: Image.asset("assets/logo/setting.png",
                      color: notifire.textshscreenprimerycolor),
                ),
              ]),
              const SizedBox(
                height: 26,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: TabBar(
                    controller: _controller,
                    labelColor: selectindex == 0
                        ? notifire.textshscreenprimerycolor
                        : notifire.textshscreenprimerycolor,
                    unselectedLabelColor: const Color(0xff808080),
                    tabs: const [
                      Tab(
                        child: Text("Update",
                            style: TextStyle(
                              fontSize: 14,
                            )),
                      ),
                      Tab(
                        child: Text("Transactions",
                            style: TextStyle(fontSize: 14)),
                      )
                    ]),
              )
            ]),
          ],
        ),
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: TabBarView(controller: _controller, children: noti),
          ),
        ),
      ),
    );
  }
}
