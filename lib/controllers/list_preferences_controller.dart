import 'package:af_provider_contact_diary_app/views/modals/modals_class.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListController extends ChangeNotifier {
  SharedPreferences prefs;

  final String _sfname = "all_name";
  final String _sfcontact = "all_contact";
  final String _sfemail = "all_email";
  final String _sfimage = "all_Image";

  final String _sfhiddenname = "all_hidden_name";
  final String _sfhiddencontact = "all_hidden_contact";
  final String _sfhiddenemail = "all_hidden_email";
  final String _sfhiddenimage = "all_hidden_Image";

  List<String> _allname = [];
  List<String> _allcontact = [];
  List<String> _allemail = [];
  List<String> _allimage = [];

  List<String> _allhiddenname = [];
  List<String> _allhiddencontact = [];
  List<String> _allhiddenemail = [];
  List<String> _allhiddenimage = [];

  List<AllContact> allContact = [];
  List<AllContact> allhiddenContact = [];

  ListController({required this.prefs});

  List<String> get getTitles {
    _allname = prefs.getStringList(_sfname) ?? [];
    return _allname;
  }
  
  List<AllContact> get getAllContact {
    _allname = prefs.getStringList(_sfname) ?? [];
    _allname = prefs.getStringList(_sfcontact) ?? [];
    _allname = prefs.getStringList(_sfemail) ?? [];

    allContact = List.generate(
      _allcontact.length,
      (index) => AllContact(
        trcontact: _allcontact[index],
        trname: _allname[index],
        tremail: _allemail[index],
        // trimage: _allimage[index],
      ),
    );
    return allContact;
  }

  List<AllContact> get getAllHiddenContacts {
    _allhiddenname = prefs.getStringList(_sfhiddenname) ?? [];
    _allcontact = prefs.getStringList(_sfhiddencontact) ?? [];
    _allhiddenimage = prefs.getStringList(_sfhiddenimage) ?? [];

    allhiddenContact = List.generate(
      _allhiddencontact.length,
      (index) => AllContact(
        trname: _allhiddenname[index],
        trcontact: _allhiddencontact[index],
        tremail: _allhiddenemail[index],
        // trimage: _allhiddenimage[index],
      ),
    );

    return allhiddenContact;
  }

  void addContact(
      {required String name, required String number, required String email})
  {
    _allname = prefs.getStringList(_sfname) ?? [];
    _allcontact = prefs.getStringList(_sfcontact) ?? [];
    _allemail = prefs.getStringList(_sfemail) ?? [];
    _allimage = prefs.getStringList(_sfimage) ?? [];

    _allname.add(name);
    _allcontact.add(number);
    // _allimage.add(imagePath);
    _allemail.add(email);

    prefs.setStringList(_sfname, _allname);
    prefs.setStringList(_sfcontact, _allcontact);
    prefs.setStringList(_sfimage, _allimage);
    prefs.setStringList(_sfemail, _allemail);
  }

  void addHiddenContact(
      {required String name,
      required String number,
      required String imagePath,
      required String email}) {
    _allhiddenname = prefs.getStringList(_sfhiddenname) ?? [];
    _allhiddencontact = prefs.getStringList(_sfhiddencontact) ?? [];
    _allhiddenemail = prefs.getStringList(_sfhiddenemail) ?? [];
    _allhiddenimage = prefs.getStringList(_sfhiddenimage) ?? [];

    _allhiddenname.add(name);
    _allhiddencontact.add(number);
    _allhiddenimage.add(imagePath);
    _allhiddenemail.add(email);

    prefs.setStringList(_sfhiddenname, _allhiddenname);
    prefs.setStringList(_sfhiddencontact, _allhiddencontact);
    prefs.setStringList(_sfhiddenimage, _allhiddenimage);
    prefs.setStringList(_sfhiddenemail, _allhiddenemail);
  }

  void removeItem({required int index}) {
    _allname = prefs.getStringList(_sfname) ?? [];
    _allcontact = prefs.getStringList(_sfcontact) ?? [];
    _allemail = prefs.getStringList(_sfemail) ?? [];
    _allimage = prefs.getStringList(_sfimage) ?? [];

    _allname.removeAt(index);
    _allimage.removeAt(index);
    _allcontact.removeAt(index);
    _allemail.removeAt(index);

    prefs.setStringList(_sfname, _allname);
    prefs.setStringList(_sfcontact, _allcontact);
    prefs.setStringList(_sfimage, _allimage);
    prefs.setStringList(_sfemail, _allemail);

    notifyListeners();
  }

  void removehiddenItem({required int index}) {
    _allhiddenname = prefs.getStringList(_sfhiddenname) ?? [];
    _allhiddencontact = prefs.getStringList(_sfhiddencontact) ?? [];
    _allhiddenemail = prefs.getStringList(_sfhiddenemail) ?? [];
    _allhiddenimage = prefs.getStringList(_sfhiddenimage) ?? [];

    _allhiddenname.removeAt(index);
    _allhiddenimage.removeAt(index);
    _allhiddencontact.removeAt(index);
    _allhiddenemail.removeAt(index);

    prefs.setStringList(_sfhiddenemail, _allhiddenemail);
    prefs.setStringList(_sfhiddenimage, _allhiddenimage);
    prefs.setStringList(_sfhiddencontact, _allhiddencontact);
    prefs.setStringList(_sfhiddenname, _allhiddenname);

    notifyListeners();
  }
}


// import 'package:af_provider_contact_diary_app/views/modals/modals_class.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ListController extends ChangeNotifier {
//   SharedPreferences prefsob;
//
//   final String _sfTitles = "all_title";
//   final String _sfSubTitles = "all_sub_title";
//
//   final String _sfHiddenName = "all_hidden_names";
//   final String _sfHiddenNumber = "all_hidden_numbers";
//   final String _sfHiddenEmail = "all_hidden_email";
//   final String _sfHiddenImage = "all_hidden_images";
//
//   List<String> _allTitles = [];
//   List<String> _allSubTitles = [];
//
//   List<String> _allHiddenNames = [];
//   List<String> _allHiddenNumbers = [];
//   List<String> _allHiddenEmail = [];
//   List<String> _allHiddenImages = [];
//
//   List<AllContact> allContacts = [];
//
//   List<AllContact> allHiddenContacts = [];
//
//   ListController({required this.prefsob});
//
//   List<String> get getTitles {
//     _allTitles = prefsob.getStringList(_sfTitles) ?? [];
//     return _allTitles;
//   }
//
//   List<String> get getSubTitles {
//     _allSubTitles = prefsob.getStringList(_sfSubTitles) ?? [];
//     return _allSubTitles;
//   }
//
//   // List<Contact> get getAllContacts {
//   //   _allTitles = prefsob.getStringList(_sfTitles) ?? [];
//   //   _allSubTitles = prefsob.getStringList(_sfSubTitles) ?? [];
//   //
//   //   // _allTitles.forEach((element) {
//   //   //   allContacts.add(Contact(title: element, subTitle: _allSubTitles[_allTitles.indexOf(element)]));
//   //   // });
//   //
//   //   _allContacts = List.generate(
//   //     _allTitles.length,
//   //     (index) => Contact(
//   //       title: _allTitles[index],
//   //       subTitle: _allSubTitles[index],
//   //     ),
//   //   );
//   //
//   //   return _allContacts;
//   // }
//
//   List<AllContact> get getAllHiddenContacts {
//     _allHiddenNames = prefsob.getStringList(_sfHiddenName) ?? [];
//     _allHiddenNumbers = prefsob.getStringList(_sfHiddenNumber) ?? [];
//     _allHiddenNumbers = prefsob.getStringList(_sfHiddenEmail) ?? [];
//     _allHiddenImages = prefsob.getStringList(_sfHiddenImage) ?? [];
//
//     allHiddenContacts = List.generate(
//       _allHiddenNumbers.length,
//       (index) => AllContact(
//         trname: _allHiddenNames[index],
//         trcontact: _allHiddenNumbers[index],
//         tremail: _allHiddenEmail[index],
//         // trimage: _allHiddenImages[index],
//       ),
//     );
//
//     return allHiddenContacts;
//   }
//
//   void addHiddenContact(
//       {required String name,
//       required String number,
//       required String imagePath}) {
//     _allHiddenNames = prefsob.getStringList(_sfHiddenName) ?? [];
//     _allHiddenNumbers = prefsob.getStringList(_sfHiddenNumber) ?? [];
//     _allHiddenImages = prefsob.getStringList(_sfHiddenImage) ?? [];
//
//     _allHiddenNames.add(name);
//     _allHiddenNumbers.add(number);
//     _allHiddenImages.add(imagePath);
//
//     prefsob.setStringList(_sfHiddenName, _allHiddenNames);
//     prefsob.setStringList(_sfHiddenNumber, _allHiddenNumbers);
//     prefsob.setStringList(_sfHiddenImage, _allHiddenImages);
//   }
//
//   void addItem({required String title, required String subtitle}) {
//     _allTitles = prefsob.getStringList(_sfTitles) ?? [];
//     _allSubTitles = prefsob.getStringList(_sfSubTitles) ?? [];
//
//     _allTitles.add(title);
//     _allSubTitles.add(subtitle);
//
//     prefsob.setStringList(_sfTitles, _allTitles);
//     prefsob.setStringList(_sfSubTitles, _allSubTitles);
//     notifyListeners();
//   }
//
//   void removeItem({required int index}) {
//     _allTitles = prefsob.getStringList(_sfTitles) ?? [];
//     _allSubTitles = prefsob.getStringList(_sfSubTitles) ?? [];
//
//     _allTitles.removeAt(index);
//     _allSubTitles.removeAt(index);
//
//     prefsob.setStringList(_sfTitles, _allTitles);
//     prefsob.setStringList(_sfSubTitles, _allSubTitles);
//     notifyListeners();
//   }
// }
