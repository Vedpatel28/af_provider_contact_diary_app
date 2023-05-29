import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroProvider extends ChangeNotifier {
  SharedPreferences? prefsob;

  String sfFirst = "First_time";

  bool firsttime = false;

  init() async {
    prefsob = await SharedPreferences.getInstance();
  }

  checkFirstTime() {
    init();

    if (prefsob != null) {
      firsttime = prefsob!.getBool(sfFirst) ?? true;
      if (firsttime) {
        prefsob!.setBool(sfFirst, false);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
