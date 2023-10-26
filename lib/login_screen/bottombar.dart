import 'package:flutter/material.dart';
import 'package:myfoodtracker/home_page/fidelity_card.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:myfoodtracker/cart/storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page/home.dart';
import '../cart/shoppingList.dart';

int selectedIndex = 0;

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  List<Widget> myChilders = const [
    Home(),
    Storage(),
    ShoppingListPage(),
    FidelityCard(),
  ];

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

  // late ColorNotifire notifire;
  @override
  Widget build(BuildContext context) {
    // notifire = Provider.of<ColorNotifire>(context, listen: true);
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return
        // WillPopScope(
        // // onWillPop: _handleWillPop,
        // child:
        Scaffold(
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: notifire.mintextscreenprimerycolor,
          backgroundColor: notifire.blackwhite,
          elevation: 0,
          selectedLabelStyle:
              const TextStyle(fontFamily: 'AirbnbCereal_W_Bk', fontSize: 12),
          fixedColor: const Color(0xff00AB67),
          unselectedLabelStyle:
              const TextStyle(fontFamily: "AirbnbCereal_W_Bk"),
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/logo/home1.png",
                    color: selectedIndex == 0
                        ? const Color(0xff00AB67)
                        : notifire.mintextscreenprimerycolor,
                    height: MediaQuery.of(context).size.height / 45),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset("assets/logo/order.png",
                    color: selectedIndex == 1
                        ? const Color(0xff00AB67)
                        : notifire.mintextscreenprimerycolor,
                    height: MediaQuery.of(context).size.height / 45),
                label: 'Dispensa'),
            BottomNavigationBarItem(
                icon: Image.asset("assets/logo/cart.png",
                    color: selectedIndex == 2
                        ? const Color(0xff00AB67)
                        : notifire.mintextscreenprimerycolor,
                    height: MediaQuery.of(context).size.height / 45),
                label: 'Spesa'),
            BottomNavigationBarItem(
              icon: Image.asset("assets/card.png",
                  color: selectedIndex == 3
                      ? const Color(0xff00AB67)
                      : notifire.mintextscreenprimerycolor,
                  height: MediaQuery.of(context).size.height / 40),
              label: 'Carte',
            ),
          ],
          onTap: (index) {
            setState(() {});
            selectedIndex = index;
          },
        ),
      ),
      body: myChilders[selectedIndex],
    );
  }
}
