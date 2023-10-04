// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
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
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: notifire.textshscreenprimerycolor,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: notifire.spleshscreenprimerycolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Legal and Policies',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: notifire.textshscreenprimerycolor),
            ),
          ],
        ),
      ),
      backgroundColor: notifire.spleshscreenprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 900,
                width: 313,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. Terms',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: notifire.textshscreenprimerycolor)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur\n'
                        'adipiscing elit. Eget ornare quam vel facilisis\n'
                        'feugiat amet sagittis arcu, tortor. Sapien,\n'
                        'consequat ultrices morbi orci semper sit\n'
                        'nulla. Leo auctor ut etiam est, amet aliquet\n'
                        'ut vivamus. Odio vulputate est id tincidunt\n'
                        'fames.',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur\n'
                        'adipiscing elit. Eget ornare quam vel\n'
                        'facilisisfeugiat amet sagittis arcu, tortor.\n'
                        'Sapien, consequat ultrices morbi orci\n'
                        'semper sit nulla. Leo auctor ut etiam est,\n'
                        'amet aliquet ut vivamus. Odio vulputate est\n'
                        'id tincidunt fames.',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('2. Changes to the Service and/or Terms:',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: notifire.textshscreenprimerycolor)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur\n'
                        'adipiscing elit. Eget ornare quam vel facilisis\n'
                        'feugiat amet sagittis arcu, tortor. Sapien,\n'
                        'consequat ultrices morbi orci semper sit\n'
                        'nulla. Leo auctor ut etiam est, amet aliquet\n'
                        'ut vivamus. Odio vulputate est id tincidunt\n'
                        'fames.',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur\n'
                        'adipiscing elit. Eget ornare quam vel\n'
                        'facilisisfeugiat amet sagittis arcu, tortor.\n'
                        'Sapien, consequat ultrices morbi orci\n'
                        'semper sit nulla. Leo auctor ut etiam est,\n'
                        'amet aliquet ut vivamus. Odio vulputate est\n'
                        'id tincidunt fames.',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('3. Create an Acknowledgment Statement',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: notifire.textshscreenprimerycolor)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur\n'
                        'adipiscing elit. Eget ornare quam vel facilisis\n'
                        'feugiat amet sagittis arcu, tortor. Sapien,\n'
                        'consequat ultrices morbi orci semper sit\n'
                        'nulla. Leo auctor ut etiam est, amet aliquet\n'
                        'ut vivamus. Odio vulputate est id tincidunt\n'
                        'fames.',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur\n'
                        'adipiscing elit. Eget ornare quam vel\n'
                        'facilisisfeugiat amet sagittis arcu, tortor.\n'
                        'Sapien, consequat ultrices morbi orci\n'
                        'semper sit nulla. Leo auctor ut etiam est,\n'
                        'amet aliquet ut vivamus. Odio vulputate est\n'
                        'id tincidunt fames.',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: notifire.textshscreenprimerycolor)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
