// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myfoodtracker/login_screen/welcome.dart';
import 'package:myfoodtracker/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  OpenFoodAPIConfiguration.userAgent = UserAgent(
    name: 'MyFoodTracker',
  );

  WidgetsFlutterBinding.ensureInitialized();

  throw Exception("Test Crash");
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
