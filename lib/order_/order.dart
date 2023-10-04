// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/favourite_/favurite.dart';
import 'package:myfoodtracker/notification/notification.dart';
import 'package:myfoodtracker/order_/all_o.dart';
import 'package:myfoodtracker/order_/press.dart';
import 'package:myfoodtracker/order_/previous.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with TickerProviderStateMixin {
//   List5(),
// List5(),
// List5()

  late TabController _controller;
  late Colornotifire notifire;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<Widget> ord = const [Allo(), Press(), Previous()];
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: notifire.spleshscreenprimerycolor,
          elevation: 0,
          toolbarHeight: 109,
          actions: [
            Column(children: [
              Row(children: [
                Center(
                  child: Container(
                    margin:
                        const EdgeInsets.only(right: 118, left: 28, top: 10),
                    height: 40,
                    width: 120,
                    child: Text("My Order",
                        style: TextStyle(
                            color: notifire.textshscreenprimerycolor,
                            fontFamily: "AirbnbCereal_W_Bd",
                            fontSize: 24)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Favurite();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    height: 19,
                    width: 19,
                    child: Image.asset(
                      "assets/logo/like.png",
                      color: notifire.textshscreenprimerycolor,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 5, left: 20, bottom: 4, right: 28),
                    //    color: notifire.spleshscreenprimerycolor,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Notifications();
                          },
                        ));
                      },
                      child: Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 8,
                          ),
                          height: 17,
                          width: 16,
                          child: Image.asset(
                            "assets/logo/notification.png",
                            color: notifire.textshscreenprimerycolor,
                            width: 17,
                            height: 16,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 8, bottom: 10, top: 4),
                          height: 12,
                          width: 12,
                          child: Image.asset("assets/Badge.png"),
                        )
                      ]),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: TabBar(
                    indicatorColor: Colors.green,
                    controller: _controller,
                    labelColor: selectindex == 0
                        ? notifire.textshscreenprimerycolor
                        : notifire.textshscreenprimerycolor,
                    unselectedLabelColor: const Color(0xff808080),
                    tabs: const [
                      Tab(
                        child: Text("All",
                            style: TextStyle(
                              fontSize: 14,
                            )),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     all = !false;
                      //     process = !true;
                      //     pravius = !false;
                      //     setState(() {
                      //
                      //     });
                      //   },
                      // child:
                      Tab(
                        child:
                            Text("On Process", style: TextStyle(fontSize: 14)),
                      ),
                      // ),
                      //  InkWell(
                      //      onTap: () {
                      //        all = !false;
                      //        process = !false;
                      //        pravius = !true;
                      //        setState(() {
                      //
                      //        });
                      //      },
                      //      child:
                      Tab(
                        child: Text("Previous", style: TextStyle(fontSize: 14)),
                      )
                    ]),
              )
            ]),
          ],
        ),
        backgroundColor: notifire.blackwhite,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 670,
                child: TabBarView(controller: _controller, children: ord),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
