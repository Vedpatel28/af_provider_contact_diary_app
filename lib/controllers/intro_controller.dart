import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroProvider extends ChangeNotifier {
  SharedPreferences? prefsob;
  String sfFirst = "First_time";
  bool firsttime = true;

  IntroProvider({required this.prefsob});

  bool get FirstTime {
    firsttime = prefsob!.getBool(sfFirst) ?? true;
    return firsttime;
  }

  void DoneIntroScreen() {
    firsttime = false;
    prefsob!.setBool(sfFirst, firsttime);
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class IntroProvider extends ChangeNotifier {
//   SharedPreferences? prefs;
//   String sfFirst = "is_first_time";
//   bool firstTime = true;
//
//   IntroProvider({required this.prefs});
//
//   bool get isFirstTime {
//     firstTime = prefs!.getBool(sfFirst) ?? true;
//     return firstTime;
//   }
//
//   void firstDone() {
//     firstTime = false;
//     prefs!.setBool(sfFirst, firstTime);
//   }
// }