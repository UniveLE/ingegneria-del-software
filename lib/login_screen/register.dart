// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/create_easy.dart';
import 'package:myfoodtracker/login_screen/login.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottombar.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hiddenpassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool status = false;
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

  bool t1 = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: notifire.spleshscreenprimerycolor,
          // toolbarHeight: 80,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, MaterialPageRoute(
                builder: (context) {
                  return Createeasy();
                },
              ));
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 240),
                  child: Text(
                    "Registrati",
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
                  margin: const EdgeInsets.only(right: 250),
                  child: Text(
                    "Nome",
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
                          margin: const EdgeInsets.only(left: 10),
                          child: const Icon(Icons.person_outline_rounded,
                              color: Color(0xffCCCCCC)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 48,
                          width: 230,
                          child: TextFormField(
                            // controller: name,
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "nome utente",
                                hintStyle: TextStyle(
                                    color: notifire.mintextscreenprimerycolor,
                                    fontSize: 14)
                                //  labelText: "user name"
                                ),
                            // validator: (value) {
                            //   if (value!.isEmpty ||
                            //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.[a-zA-Z0-9].[a-zA-Z]+")
                            //           .hasMatch(value!)) {
                            //     return 'Enter a valid username!';
                            //   }
                            //   return null;
                            // },
                            // onChanged: (val) {},
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
                        SizedBox(
                          height: 48,
                          width: 230,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: notifire.mintextscreenprimerycolor,
                                    fontSize: 14)),
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
                            margin: const EdgeInsets.only(left: 10),
                            child: const Icon(Icons.lock_outline,
                                color: Color(0xffCCCCCC))),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 48,
                          width: 250,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: hiddenpassword,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  padding: const EdgeInsets.only(left: 70),
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
                                    fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              color: notifire.spleshscreenprimerycolor,
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(width: 2, color: Colors.green)),
                          child: Checkbox(
                              side: const BorderSide(
                                style: BorderStyle.none,
                                color: Colors.green,
                              ),
                              checkColor: notifire.spleshscreenprimerycolor,
                              value: t1,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                  } else {}
                                  t1 = value!;
                                });
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "I agree with",
                            style: TextStyle(
                                color: notifire.textshscreenprimerycolor,
                                fontFamily: "AirbnbCereal_W_Bk",
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "Terms  & Condition",
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: "AirbnbCereal_W_Bk",
                                fontSize: 16),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                InkWell(
                    onTap: () async {
                      registration(context, nameController.text,
                          emailController.text, passwordController.text);
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
                        "Create account",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "AirbnbCereal_W_Bd"),
                      )),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 100),
                      child: Text("I have an account.",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AirbnbCereal_W_Bd",
                              color: notifire.textshscreenprimerycolor)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Login();
                          },
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 80),
                        child: const Text("  Login",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "AirbnbCereal_W_Bd",
                                color: Color(0xff00AB67))),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

void registration(context, name, email, password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const Bottombar();
      },
    ));
  } on FirebaseAuthException catch (e) {
    String errorText = "";
    if (e.code == 'weak-password') {
      errorText = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      errorText = 'The account already exists for that email.';
    } else if (e.code == "invalid-email") {
      errorText = "email invalida.";
    }

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
  }
}
