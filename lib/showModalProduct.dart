import 'package:flutter/material.dart';
import 'package:myfoodtracker/_utils/user.dart';
import 'package:myfoodtracker/theme/colors.dart';
import 'package:openfoodfacts/openfoodfacts.dart' as OpenFoodFact;

void showProductModal(OpenFoodFact.Product product, context) {
  Map<String, String> nutriments = product.nutriments!.toData();
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context,
            StateSetter setState1 /*You can rename this!*/) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: darkPrimeryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: 5,
                        width: 50,
                        child: Image.asset("assets/Line.png"),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 5, top: 20, right: 5),
                          //height: 319,
                          //width: 319,
                          decoration: BoxDecoration(
                            color: const Color(0xffF2FBF7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: product.images != null &&
                                  product.images![0].url != null
                              ? PageView.builder(
                                  itemCount: product.images!.length,
                                  itemBuilder: (_, i) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              height: 270,
                                              width: 270,
                                              child: Image.network(
                                                  "${product.images![i].url}"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                )
                              : Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          height: 270,
                                          width: 270,
                                          child: Image.network(
                                              "${product.imageFrontUrl}"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 375,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 28, top: 10),
                              //height: 30,
                              child: Text(
                                "${product.productName}",
                                style: TextStyle(
                                  fontFamily: "AirbnbCereal_W_Bk",
                                  fontSize: 18,
                                  color: textdarkprimeryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            //height: 50,
                            //width: 375,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Valori nutrizionali:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                for (int i = 0;
                                    i < nutriments.keys.toList().length;
                                    i++)
                                  Text(
                                      "${nutriments.keys.toList()[i]} : ${nutriments[nutriments.keys.toList()[i]]}",
                                      style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            //height: 50,
                            //width: 375,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Allergeni:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                for (int i = 0;
                                    i < product.allergens!.names.length;
                                    i++)
                                  Text(product.allergens!.names[i],
                                      style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              //width: 290,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Text(
                                  "Chiudi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "AirbnbCereal_W_Md",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              User.getActualUser().addProductToShoppingList(product);
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              //width: 290,
                              decoration: BoxDecoration(
                                color: const Color(0xff00AB67),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Text(
                                  "Aggiungi alla lista",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "AirbnbCereal_W_Md",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
