// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/favourite_/favurite.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
  bool hight = false;
  List<String> slide = [
    "assets/logo/slide_1.png",
    "assets/logo/slide_2.png",
    "assets/logo/slide_3.png"
  ];
  late Colornotifire notifire;

  List<List4> ditails3 = [
    List4(
        image1: "assets/kiwi.png",
        name1: "Kiwifruit",
        name2: "approx 0.25lb",
        name3: "\$0.89"),
    List4(
        image1: "assets/cobbage1.png",
        name1: "Cobbage",
        name2: "approx 2lb",
        name3: "\$3.49"),
    List4(
        image1: "assets/crad.png",
        name1: "Crab",
        name2: "6ct | \$4.50/ct",
        name3: "\$26.9"),
    List4(
        image1: "assets/almond.png",
        name1: "Almond",
        name2: "16oz | \$8.99/lb",
        name3: "\$8.99"),
    List4(
        image1: "assets/pasta.png",
        name1: "Pasta",
        name2: "19oz | \$4.91/lb",
        name3: "\$3.49"),
    List4(
        image1: "assets/beef.png",
        name1: "Beef Chuck Stew",
        name2: "12 - 14ct/lb",
        name3: "\$26.99"),
  ];
  bool all = false;
  bool you = true;
  bool artichoke = true;
  bool barcoli = true;
  int cnt = 0;
  //late TabController _tabController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    //  _controller = PageController(initialPage: 0);
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  int currentIndex = 0;
  // late PageController _controller;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
            actions: [
              Column(),
            ]),
        backgroundColor: notifire.blackwhite,
        body: const SingleChildScrollView(),
      ),
    );
  }
}
