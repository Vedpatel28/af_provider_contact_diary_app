import 'package:flutter/cupertino.dart';

class MyStepper extends ChangeNotifier {
  int steppercounte = 0;

  stepperup() {
    notifyListeners();
    steppercounte++;
  }

  stepperdoun() {
    steppercounte--;
    notifyListeners();
  }
}
