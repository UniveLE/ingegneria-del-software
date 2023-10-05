// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myfoodtracker/login_screen/create_easy.dart';
import 'package:myfoodtracker/login_screen/login.dart';
import 'package:myfoodtracker/login_screen/login_num.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hiddenpassword = true;
  TextEditingController phonenumber = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();

  ///============== email validation ====================
  //static const String email = 'email@example.com';
  //final bool isValid = EmailValidator.validate(email);

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
  // void _submit() {
  //   final isValid = _formKey.currentState!.validate();
  //
  //   if (!isValid) {
  //     return;
  //   }
  //   _formKey.currentState!.save();
  // }
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
                    "Register",
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
                    "Your Name",
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
                                hintText: "user name",
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
                    "Email or Phone Number",
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
                            // controller:Phonenumber ,
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "Email or Phone Number",
                                hintStyle: TextStyle(
                                    color: notifire.mintextscreenprimerycolor,
                                    fontSize: 14)
                                //  labelText: "user name"
                                ),
                            // validator: (value) {
                            //   if (value!.isEmpty ||
                            //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //           .hasMatch(value!)) {
                            //     return 'Enter a valid Email or phone number!';
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
                            // controller: passwordController,
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
                                    fontSize: 14)
                                //  labelText: "user name"
                                ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return "incorrect password. Please reenter your password and try again."
                            //         " If the \n problem persists, try resetting your password by click ForgePassword?";
                            //   } else if (value.length < 6) {
                            //     return "password length should be atleast 6";
                            //   }
                            //   return null;
                            // },
                            // onChanged: (val) {},
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
                // InkWell(onTap: () {
                //  setState(() {
                //    _submit();
                //    if(_formKey.currentState!.validate()){
                //      Navigator.push(context, MaterialPageRoute(builder: (context) {
                //        return login_num();
                //      },));
                //    }
                //  });
                //  _submit();
                //  print(name.text);
                //  print(Phonenumber.text);
                //  print(passwordController.text);
                // },
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Loginnums();
                        },
                      ));
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
