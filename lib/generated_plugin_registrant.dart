//
// Generated file. Do not edit.
//

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:geolocator_web/geolocator_web.dart';
//import 'package:location_web/location_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:smart_auth/smart_auth_web.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  FluttertoastWebPlugin.registerWith(registrar);
  GeolocatorPlugin.registerWith(registrar);
  //LocationWebPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  SmartAuthWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
