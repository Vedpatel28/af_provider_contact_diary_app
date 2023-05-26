
import 'package:easy_stepper/easy_stepper.dart';

class Themechanger extends ChangeNotifier {
  bool themechange = false;

  changetheme() {
    themechange = !themechange;
    notifyListeners();
  }
}