import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStepper extends ChangeNotifier {
  int steppercounte = 0;

  stepperup() {
    if (steppercounte < 3) {
      steppercounte++;
    }
    notifyListeners();
  }

  stepperdoun() {
    if (steppercounte > 0) {
      steppercounte--;
    }
    notifyListeners();
  }
}

class Themechanger extends ChangeNotifier {
  bool themechange = true;

  changetheme() {
    themechange = !themechange;
    notifyListeners();
  }
}
