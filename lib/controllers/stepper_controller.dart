import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStepper extends ChangeNotifier {
  static String? name;
  static int? contact;
  static String? email;
  static File? image;

  static List allcontct = [];

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

  steptepped({required int index}) {
    steppercounte == index;
    notifyListeners();
  }

  bool isActiveannabelle({required int index}) {
    return steppercounte == index;
  }

  stepstate({required int index}) {
    return steppercounte > index
        ? StepState.complete
        : steppercounte == index
            ? StepState.editing
            : StepState.disabled;
  }

  imageset({required File img}) {
    image = img;
    notifyListeners();
  }
}
