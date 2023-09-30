import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themechanger extends ChangeNotifier {

  bool themechange = false;
  final String _sfTheme = "is_dark";
  SharedPreferences preferences;

  Themechanger({required this.preferences});

  bool get getTheme {
    if (preferences.getBool(_sfTheme) ?? false) {
      themechange = preferences.getBool(_sfTheme)!;
    } else {
      preferences.setBool(_sfTheme, themechange);
    }
    return themechange;
  }

  changetheme() {
    themechange = !themechange;
    preferences.setBool(_sfTheme, themechange);
    notifyListeners();
  }
}
