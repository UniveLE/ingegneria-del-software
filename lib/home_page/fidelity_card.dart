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
          onPressed: () async {
            await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return FidelityCardPage();
              },
            ));
            loadCards();
          },
          backgroundColor: const Color(0xff00AB67),
          child: const Icon(Icons.add)),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: notifire.spleshscreenprimerycolor,
        /*leading: BackButton(
          color: notifire.textshscreenprimerycolor,
        ),*/
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 20, top: 15),
                              height: 40,
                              width: 250,
                              child: Text(
                                cards[index].name,
                                style: TextStyle(
                                    fontFamily: "AirbnbCereal_W_Md",
                                    color: notifire.textshscreenprimerycolor,
                                    fontSize: 16),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                User.getActualUser()
                                    .removeFidelityCard(cards[index].code)
                                    .then((value) => {loadCards()});
                              },
                              icon: const Icon(Icons.delete),
                              color: notifire.textshscreenprimerycolor,
                            )
                          ],
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

class FidelityCardPage extends StatelessWidget {
  FidelityCardPage({super.key});

  late Colornotifire notifire;
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: notifire.spleshscreenprimerycolor,
        automaticallyImplyLeading: true,
        elevation: 0,
        toolbarHeight: 60,
        title: Text(
          'Nuova carta',
          style: TextStyle(color: notifire.textshscreenprimerycolor),
        ),
        leading: BackButton(
          color: notifire.textshscreenprimerycolor,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            color: notifire.textshscreenprimerycolor,
            onPressed: () {
              User.getActualUser()
                  .addFidelityCard(FidelityCardModel.FidelityCard(
                      code: codeController.text, name: nameController.text))
                  .then((value) => {Navigator.of(context).pop()});
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 120),
              width: 200,
              child: Text(
                "Nome carta",
                style: TextStyle(
                    fontSize: 12,
                    color: notifire.mintextscreenprimerycolor,
                    fontFamily: "AirbnbCereal_W_Bd"),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                height: 60,
                width: 319,
                decoration: BoxDecoration(
                  color: notifire.topscreenprimerycolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: SizedBox(
                    height: 48,
                    width: 230,
                    child: TextField(
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
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(right: 120),
              width: 200,
              child: Text(
                "Codice della carta",
                style: TextStyle(
                    fontSize: 12,
                    color: notifire.mintextscreenprimerycolor,
                    fontFamily: "AirbnbCereal_W_Bd"),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                height: 60,
                width: 319,
                decoration: BoxDecoration(
                  color: notifire.topscreenprimerycolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: SizedBox(
                    height: 48,
                    width: 230,
                    child: TextField(
                      keyboardType: TextInputType.number,
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
