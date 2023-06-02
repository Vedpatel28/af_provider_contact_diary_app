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



//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// class MyStepperController extends ChangeNotifier {
//   int currentStep = 0;
//   String? name;
//   int? contact;
//   String? email;
//   String? web;
//
//   bool isHidden = false;
//
//   void hide() {
//     isHidden = !isHidden;
//     notifyListeners();
//   }
//
//   File? image;
//
//   void stepIncrease() {
//     if (currentStep < 4) {
//       currentStep++;
//     }
//     print("Step: $currentStep");
//     notifyListeners();
//   }
//
//   void stepDecrease() {
//     if (currentStep > 0) {
//       currentStep--;
//     }
//     print("Step: $currentStep");
//     notifyListeners();
//   }
//
//   void stepTapped({required int index}) {
//     currentStep = index;
//     print("Step: $currentStep");
//     notifyListeners();
//   }
//
//   bool isStepActive({required int index}) {
//     return currentStep == index;
//   }
//
//   void setImage({required File img}) {
//     image = img;
//     notifyListeners();
//   }
//
//   StepState myState({required int index}) {
//     return currentStep > index
//         ? StepState.complete
//         : currentStep == index
//         ? StepState.editing
//         : StepState.disabled;
//   }
// }