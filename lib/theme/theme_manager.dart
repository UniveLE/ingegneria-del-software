import 'package:flutter/material.dart';

import 'colors.dart';

class Colornotifire with ChangeNotifier{
  bool _isdark = false;
  set setlsDark(value){
    _isdark = value;
    notifyListeners();
  }
  get spleshscreenprimerycolor => _isdark? primeryColor:darkPrimeryColor;
  get textshscreenprimerycolor => _isdark? textprimeryColor:textdarkprimeryColor;
  get mintextscreenprimerycolor => _isdark? mintextprimeryColor:mintextdarkprimeryColor;
  get iconscreenprimerycolor => _isdark? iconprimeryColor:icondarkprimeryColor;
  get termsscreenprimerycolor => _isdark? termsprimeryColor:termsdarkprimeryColor;
  get skipscreenprimerycolor => _isdark? skipprimeryColor: skipdarkprimeryColor;
  get topscreenprimerycolor => _isdark? topscreemprimeryColor: topscreendarkprimeryColor;
  get blackwhite => _isdark? Colors.black: Colors.white;
}