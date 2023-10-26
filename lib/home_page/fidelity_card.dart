// ignore_for_file: file_names
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:myfoodtracker/_utils/user.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../_utils/model/fidelity_card.dart' as FidelityCardModel;

class FidelityCard extends StatefulWidget {
  const FidelityCard({Key? key}) : super(key: key);

  @override
  State<FidelityCard> createState() => _FidelityCardState();
}

class _FidelityCardState extends State<FidelityCard> {
  late Colornotifire notifire;
  List<FidelityCardModel.FidelityCard> cards = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  void loadCards() async {
    cards = await User.getActualUser().getFidelityCards();
    setState(() {});
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
      backgroundColor: notifire.spleshscreenprimerycolor,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.amber,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Nome",
                              hintStyle: TextStyle(
                                  color: notifire.mintextscreenprimerycolor,
                                  fontSize: 14)
                              //  labelText: "user name"
                              ),
                        ),
                        TextField(
                          controller: codeController,
                          decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Codice",
                              hintStyle: TextStyle(
                                  color: notifire.mintextscreenprimerycolor,
                                  fontSize: 14)
                              //  labelText: "user name"
                              ),
                        ),
                        const Text('Modal BottomSheet'),
                        ElevatedButton(
                          child: const Text('Chiudi'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: const Color(0xff00AB67),
          child: const Icon(Icons.add)),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: notifire.spleshscreenprimerycolor,
        leading: BackButton(
          color: notifire.textshscreenprimerycolor,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 28, right: 210),
            height: 30,
            width: 124,
            child: Text(
              "Carte fedeltà",
              style: TextStyle(
                  fontFamily: "AirbnbCereal_W_Md",
                  fontSize: 16,
                  color: notifire.textshscreenprimerycolor),
            ),
          ),
          SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12, width: 1)),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 20, top: 15),
                          height: 40,
                          width: 319,
                          child: Text(
                            cards[index].name,
                            style: TextStyle(
                                fontFamily: "AirbnbCereal_W_Md",
                                color: notifire.textshscreenprimerycolor,
                                fontSize: 16),
                          ),
                        ),
                        BarcodeWidget(
                          data: cards[index].code,
                          barcode: Barcode.ean13(),
                          height: 150,
                          width: 300,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 15))
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
