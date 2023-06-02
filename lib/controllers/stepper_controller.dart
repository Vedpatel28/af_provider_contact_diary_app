import 'dart:io';

import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStepper extends ChangeNotifier {
  File? image;

  int steppercounte = 0;

  bool Hiddentrue = false;

  void hide() {
    Hiddentrue = !Hiddentrue;
    notifyListeners();
  }

  stepperup() {
    if (steppercounte < 4) {
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

  void steptepped({required int index}) {
    steppercounte = index;
    print(steppercounte);
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
    allglobalvar.image = img;
    notifyListeners();
  }

  aftervalidat() {
    ++steppercounte;
    notifyListeners();
  }

// laststepdecrease() {
//   steppercounte == 0;
//   notifyListeners();
// }
}
