// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/_utils/food_service.dart';
import 'package:myfoodtracker/showModalProduct.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchResult extends StatefulWidget {
  final PnnsGroup1? category;
  final PnnsGroup2? category2;
  final String? name;
  final String? brand;
  final String? title;

  const SearchResult(
      {Key? key,
        this.title,
        this.category,
        this.category2,
        this.name,
        this.brand})
      : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Product>? products = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    products = await FoodService.searchProduct(
        name: widget.name,
        brand: widget.brand,
        category: widget.category,
        category2: widget.category2,
        size: 100);
    setState(() {});
  }

  bool selectedcar = true;
  bool selectedmotorcycle = false;
  bool selectedtruck = false;
  int currentIndex = 0;
  late PageController _controller;
  List<String> slide = [
    "assets/logo/slide_1.png",
    "assets/logo/slide_2.png",
    "assets/logo/slide_3.png"
  ];
  List<List1> ditails = [
    List1(
        image1: "assets/veg1.png",
        name1: "Brocoli",
        name2: "approx 0.6lb",
        name3: "\$1.29"),
    List1(
        image1: "assets/veg2.png",
        name1: "Cobbage",
        name2: "approx 6oz",
        name3: "\$3.49"),
    List1(
        image1: "assets/veg3.png",
        name1: "Carrot",
        name2: "approx 1lb",
        name3: "\$2.49"),
    List1(
        image1: "assets/veg4.png",
        name1: "Corn",
        name2: "4ct, approx 2lb",
        name3: "\$5.99"),
    List1(
        image1: "assets/veg5.png",
        name1: "Pepper",
        name2: "approx 1oz",
        name3: "\$0.49"),
    List1(
        image1: "assets/veg6.png",
        name1: "Potato",
        name2: "approx 3lb bag",
        name3: "\$6.99"),
  ];
  int cnt = 0;
  bool all = false;
  bool you = true;
  bool artichoke = true;
  bool barcoli = true;
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
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                margin: const EdgeInsets.only(top: 8, bottom: 12),
                height: 10,
                child: Icon(Icons.arrow_back,
                    size: 20, color: notifire.textshscreenprimerycolor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  right: 160, left: 80, top: 8, bottom: 10),
              child: Center(
                child: Text(
                  widget.title ??
                      widget.name?.toString() ??
                      widget.category?.toString() ??
                      widget.brand.toString(),
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
          const Padding(padding: EdgeInsets.only(top: 20)),
          Column(children: [
            Container(
              // margin: EdgeInsets.only(top: 10),
              height: 680,
              width: MediaQuery.of(context).size.width,
              // color: Colors.blue,
              color: notifire.spleshscreenprimerycolor,

              child: GridView.builder(
                //physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    mainAxisExtent: 230),
                itemCount: products?.length,
                addRepaintBoundaries: true,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: notifire.topscreenprimerycolor)),
                      child: InkWell(
                        onTap: () {
                          showProductModal(products![index], context);
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 30),
                              height: 128,
                              width: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(products![index]
                                          .imageFrontUrl ??
                                          'https://static.openfoodfacts.org/images/misc/openfoodfacts-logo-en-178x150.png'),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                      width: 1,
                                      color: notifire.topscreenprimerycolor)),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 28, right: 28),
                              height: 60,
                              width: 132,
                              child: Text(
                                "${products?[index].productName}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "AirbnbCereal_W_Md",
                                    color: notifire.textshscreenprimerycolor),
                              ),
                            ),
                            Row(children: [
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  "assets/plus1.png",
                                  fit: BoxFit.cover,
                                ),
                              )
                            ]),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}

class List1 {
  String? image1;
  String? name1;
  String? name2;
  String? name3;

  List1({this.image1, this.name1, this.name2, this.name3});
}

class Slid {
  String image;

  Slid(this.image);
}