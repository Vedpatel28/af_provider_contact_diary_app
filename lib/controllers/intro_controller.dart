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