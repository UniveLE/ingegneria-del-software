// ignore_for_file: file_names
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfoodtracker/login_screen/register.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottombar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hiddenpassword = true;
  late Colornotifire notifire;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;
  var output = "";

  //
  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Bottombar()));
    } /*else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    }*/
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   passwordController.dispose();
  //   Phonenumber.dispose();
  //   super.dispose();
  // }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setlsDark = false;
    } else {
      notifire.setlsDark = previusstate;
    }
  }

  // Future<bool> _onWillPop() async {
  //   return (await showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: new Text('Are you sure?'),
  //       content: new Text('Do you want to exit an App'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           //<-- SEE HERE
  //           child: new Text('No'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             exit(0);
  //           }, // <-- SEE HERE
  //           child: new Text('Yes'),
  //         ),
  //       ],
  //     ),
  //   )) ??
  //       false;
  // }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: notifire.spleshscreenprimerycolor,
          // toolbarHeight: 80,
          leading: GestureDetector(
            onTap: () {
              exit(0);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 8, left: 15, bottom: 8),
              height: 15,
              width: 12,
              child: Icon(
                Icons.arrow_back,
                color: notifire.iconscreenprimerycolor,
              ),
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: notifire.spleshscreenprimerycolor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 260),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: "AirbnbCereal_W_Bd",
                      color: notifire.textshscreenprimerycolor,
                      fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(right: 120),
                width: 200,
                child: Text(
                  "Email",
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
                  child: Row(
                    children: [
                      Center(
                        child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            height: 20,
                            width: 22,
                            //   color: Colors.blue,
                            child: Center(
                              child: Image.asset(
                                "assets/logo/profi.png",
                                color: const Color(0xffCCCCCC),
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Center(
                        child: SizedBox(
                          height: 48,
                          width: 230,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: notifire.mintextscreenprimerycolor,
                                    fontSize: 14)
                                //  labelText: "user name"
                                ),
                          ),
                        ),
                      )
                    ],
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
                  "Password",
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
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Icon(
                            Icons.lock_outline,
                            color: Color(0xffCCCCCC),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 48,
                        width: 250,
                        child: TextField(
                          obscureText: hiddenpassword,
                          controller: passwordController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                padding: const EdgeInsets.only(left: 50),
                                onPressed: () {
                                  setState(() {
                                    hiddenpassword = !hiddenpassword;
                                  });
                                },
                                icon: hiddenpassword
                                    ? const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Color(0xffCCCCCC),
                                      )
                                    : Image.asset("assets/logo/pass.png"),
                              ),
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "password",
                              hintStyle: TextStyle(
                                  color: notifire.mintextscreenprimerycolor,
                                  fontSize: 14)
                              //  labelText: "user name"
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  loginapi(context);
                  /*Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Loginnums();
                    },
                  ));*/
                },
                child: Container(
                  height: 60,
                  width: 319,
                  decoration: BoxDecoration(
                      color: const Color(0xff00AB67),
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "AirbnbCereal_W_Bd"),
                  )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 18,
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/google.jpg'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Text(
                          'Sign in with Google',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ))),
                onTap: () {
                  loginWithGoogle(context);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 65),
                    child: Text("I dont't have an account.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "AirbnbCereal_W_Bd",
                            color: notifire.textshscreenprimerycolor)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Register();
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 65),
                      child: const Text("  Register",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AirbnbCereal_W_Bd",
                              color: Colors.green)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginapi(context) async {
    try {
      /*final credential = */ await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Bottombar()));
    } on FirebaseAuthException catch (e) {
      String errorText = "";
      if (e.message != null) errorText = e.message!;

      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Errore'),
                content: Text(errorText),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
    } catch (e) {
      print(e);
    }
  }
}

void loginWithGoogle(context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  //User? user;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      /*final UserCredential userCredential =
          */
      await auth.signInWithCredential(credential);

      //user = userCredential.user;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Bottombar()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        // handle the error here
      } else if (e.code == 'invalid-credential') {
        // handle the error here
      }
    } catch (e) {
      // handle the error here
    }
  }
}
