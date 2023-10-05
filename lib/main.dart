// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myfoodtracker/login_screen/welcome.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Colornotifire(),
        )
      ],
      child: const MaterialApp(
        home: Onbording(),
        debugShowCheckedModeBanner: false,
      )));
}
