// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/_utils/food_service.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../showModalProduct.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Colornotifire notifire;
  List<Product>? products = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      FoodService.searchProduct(name: '').then((result) => {products = result});
    });
  }

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
                    right: 160, top: 8, left: 110, bottom: 10),
                child: Center(
                  child: Text(
                    "Search",
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 8),
                        height: 50,
                        width: 319,
                        decoration: BoxDecoration(
                          color: notifire.topscreenprimerycolor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              height: 50,
                              width: 200,
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    FoodService.searchProduct(name: text)
                                        .then((result) => {products = result});
                                    //FoodService.getProduct('8013355998832').then((result) => {products?.add(result!)});
                                  });
                                },
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: "Search anything",
                                    hintStyle: TextStyle(
                                        color: Color(0xff808080), fontSize: 14)
                                    //  icon: Icon(Icons.search),
                                    //  labelText: "user name"
                                    ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 63),
                              child: const Icon(Icons.search,
                                  color: Color(0xffCCCCCC)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                        color: notifire.topscreenprimerycolor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 28, left: 28, right: 200),
                        height: 30,
                        width: 130,
                        child: Text(
                          "Risultati",
                          style: TextStyle(
                              fontFamily: "AirbnbCereal_W_Md",
                              fontSize: 16,
                              color: notifire.textshscreenprimerycolor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: products != null ? products?.length : 0,
                (context, index) {
                  return GestureDetector(
                      onTap: () {
                        print("Container clicked AAAAAAAAAAAAAAAAAAA");
                        showProductModal(products![index], context);
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 28, top: 14),
                            height: 50,
                            width: 50,
                            child: products?[index].imageFrontUrl != null
                                ? Image.network(
                                    "${products?[index].imageFrontUrl}")
                                : Image.asset("assets/kiwi.png"),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, right: 150, left: 16),
                                //height: 44,
                                width: 164,
                                child: Text("${products?[index].productName}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            notifire.textshscreenprimerycolor,
                                        fontFamily: "AirbnbCereal_W_Md")),
                              ),
                            ],
                          )
                        ],
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
