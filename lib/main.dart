// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myfoodtracker/login_screen/welcome.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
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
