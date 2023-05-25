import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStepper extends ChangeNotifier {
  String? name;
  int? contact;
  String? email;
  File? image;

  int steppercounte = 0;

  List allcontct = [];

  // MyStepper({
  //   required this.name,
  //   required this.email,
  //   required this.image,
  //   required this.contact,
  // });

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

class Themechanger extends ChangeNotifier {
  bool themechange = false;

  changetheme() {
    themechange = !themechange;
    notifyListeners();
  }
}
