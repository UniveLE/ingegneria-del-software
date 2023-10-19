import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/colors.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page/search.dart';

void showProductModal(Product product, context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (BuildContext context,
          StateSetter setState1 /*You can rename this!*/) {
        return SizedBox(
            child: SingleChildScrollView(
                child: Column(children: [
          Container(
              margin: const EdgeInsets.only(top: 70),
              height: 610,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: darkPrimeryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28))),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 5,
                  width: 50,
                  child: Image.asset("assets/Line.png"),
                ),
                Column(children: [
                  Center(
                    child: Container(
                        margin:
                            const EdgeInsets.only(left: 18, top: 20, right: 18),
                        height: 319,
                        width: 319,
                        decoration: BoxDecoration(
                            color: const Color(0xffF2FBF7),
                            borderRadius: BorderRadius.circular(10)),
                        child: product.images != null &&
                                product.images![0].url != null
                            ? PageView.builder(
                                itemCount: product.images!.length,
                                itemBuilder: (_, i) {
                                  return Column(children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          height: 270,
                                          width: 270,
                                          //color: Colors.blueAccent,
                                          child: Image.network(
                                              "${product.images![i].url}"),
                                          //child: Image.network("${product.imageFrontUrl}"),
                                        ),
                                      ],
                                    ),
                                  ]);
                                })
                            : Column(children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      height: 270,
                                      width: 270,
                                      //color: Colors.blueAccent,
                                      //child: Image.network("${product.images![i].url}"),
                                      child: Image.network(
                                          "${product.imageFrontUrl}"),
                                    ),
                                  ],
                                ),
                              ])),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 28, top: 20, right: 28),
                            height: 30,
                            width: 220,
                            child: Text("${product.productName}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: darkPrimeryColor,
                                    fontFamily: "AirbnbCereal_W_Md")),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 28, bottom: 20, right: 150),
                            height: 30,
                            width: 100,
                            child: Text("${product.productName}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: mintextdarkprimeryColor,
                                    fontFamily: "AirbnbCereal_W_Bk")),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 50,
                      width: 375,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 28, bottom: 20, top: 10),
                            height: 30,
                            //     width: 55,
                            child: Text(
                              "${product.productName}",
                              style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  fontSize: 16,
                                  color: textdarkprimeryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //TODO: aggiungere alla lista
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        height: 50,
                        width: 290,
                        decoration: BoxDecoration(
                            color: const Color(0xff00AB67),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(
                            child: Text(
                          "Aggiungi alla lista della spesa",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AirbnbCereal_W_Md",
                              color: Colors.white),
                        )),
                      ),
                    )
                  ])
                ])
              ]))
        ])));
      });
    },
  );
}
