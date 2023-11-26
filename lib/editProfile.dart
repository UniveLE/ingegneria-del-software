// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfile();
}

class _editProfile extends State<editProfile> {
  late Colornotifire notifire;
  List<Product>? products = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<Colornotifire>(context, listen: true);
    TextEditingController _nameController = TextEditingController(
        text: FirebaseAuth.instance.currentUser?.displayName);
    TextEditingController _emailController =
        TextEditingController(text: FirebaseAuth.instance.currentUser?.email);
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: notifire.textshscreenprimerycolor),
          elevation: 0,
          backgroundColor: notifire.spleshscreenprimerycolor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Modifica il profilo',
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inserisci il nome';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inserisci la email';
                    }
                    // You can add more validation for email format if needed
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    // Password validation logic goes here if needed
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    String newName = _nameController.text;
                    String newEmail = _emailController.text;
                    String newPassword = _passwordController.text;


                    if(FirebaseAuth.instance.currentUser!.displayName != newName){
                      FirebaseAuth.instance.currentUser?.updateDisplayName(newName);
                    }
                    print(FirebaseAuth.instance.currentUser!.emailVerified);
                    try {
                      if (FirebaseAuth.instance.currentUser!.email != newEmail &&
                          FirebaseAuth.instance.currentUser!.emailVerified) {
                       //await FirebaseAuth.instance.currentUser?.sendEmailVerification();

                       await FirebaseAuth.instance.currentUser?.updateEmail(newEmail).then((_) {
                          // L'aggiornamento dell'email è avvenuto con successo
                        }).catchError((error) {
                          // Gestisci qui gli errori nell'aggiornamento dell'email
                          print("Errore durante l'aggiornamento dell'email: $error");
                        });
                      }
                    } catch (e) {
                      print("Si è verificato un errore: $e");
                    }

                    if(newPassword != '') {
                      FirebaseAuth.instance.currentUser
                          ?.updatePassword(newPassword);
                    }
                    setState(() {});
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 14),
                      backgroundColor: Colors.green),
                  child: const Text('Salva'),
                ),
              ],
            ),
          ),
        ));
  }
}
