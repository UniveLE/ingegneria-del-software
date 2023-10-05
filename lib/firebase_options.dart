// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC5D40WrPKjb--fpTjytaDtZe1eJt42uU0',
    appId: '1:720190357884:web:5a8e8fae6f2469c68fa4f9',
    messagingSenderId: '720190357884',
    projectId: 'myfoodtracker-momi',
    authDomain: 'myfoodtracker-momi.firebaseapp.com',
    storageBucket: 'myfoodtracker-momi.appspot.com',
    measurementId: 'G-JT3B847T1P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5fwO8MfnMzOWcmo0K_IGhSVZI8-NatEI',
    appId: '1:720190357884:android:9e7cd664bdbe2ec68fa4f9',
    messagingSenderId: '720190357884',
    projectId: 'myfoodtracker-momi',
    storageBucket: 'myfoodtracker-momi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-Y8RwiZ5iG7X2a2aL8hCFBMyqM-6zDm8',
    appId: '1:720190357884:ios:193888b045a97aec8fa4f9',
    messagingSenderId: '720190357884',
    projectId: 'myfoodtracker-momi',
    storageBucket: 'myfoodtracker-momi.appspot.com',
    iosBundleId: 'com.example.myfoodtracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-Y8RwiZ5iG7X2a2aL8hCFBMyqM-6zDm8',
    appId: '1:720190357884:ios:4be68d0270f7fcfb8fa4f9',
    messagingSenderId: '720190357884',
    projectId: 'myfoodtracker-momi',
    storageBucket: 'myfoodtracker-momi.appspot.com',
    iosBundleId: 'com.example.myfoodtracker.RunnerTests',
  );
}