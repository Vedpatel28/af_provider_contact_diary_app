import 'package:af_provider_contact_diary_app/views/modals/modals_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListController extends ChangeNotifier {
  SharedPreferences prefs;

  final String _sfname = "all_name";
  final String _sfcontact = "all_contact";
  final String _sfemail = "all_email";

  // final String _sfimage = "all_Image";

  final String _sfhiddenname = "all_hidden_name";
  final String _sfhiddencontact = "all_hidden_contact";
  final String _sfhiddenemail = "all_hidden_email";

  // final String _sfhiddenimage = "all_hidden_Image";

  List<String> _allname = [];
  List<String> _allcontact = [];
  List<String> _allemail = [];

  // List<String> _allimage = [];

  List<String> _allhiddenname = [];
  List<String> _allhiddencontact = [];
  List<String> _allhiddenemail = [];

  // List<String> _allhiddenimage = [];

  List<AllContact> allContact = [];
  List<AllContact> allhiddenContact = [];

  ListController({required this.prefs});

  List<AllContact> get getAllContact {
    _allname = prefs.getStringList(_sfname) ?? [];
    _allcontact = prefs.getStringList(_sfcontact) ?? [];
    _allemail = prefs.getStringList(_sfemail) ?? [];
    // _allimage = prefs.getStringList(_sfimage) ?? [];

    allContact = List.generate(
      _allcontact.length,
      (index) => AllContact(
        trcontact: _allcontact[index],
        trname: _allname[index],
        tremail: _allemail[index],
        // trimage: _allimage[index] as File,
      ),
    );
    return allContact;
  }

  List<AllContact> get getAllHiddenContacts {
    _allhiddenname = prefs.getStringList(_sfhiddenname) ?? [];
    _allhiddencontact = prefs.getStringList(_sfhiddencontact) ?? [];
    _allhiddenemail = prefs.getStringList(_sfhiddenemail) ?? [];
    // _allhiddenimage = prefs.getStringList(_sfhiddenimage) ?? [];

    allhiddenContact = List.generate(
      _allhiddencontact.length,
      (index) => AllContact(
        trname: _allhiddenname[index],
        trcontact: _allhiddencontact[index],
        tremail: _allhiddenemail[index],
        // trimage: _allhiddenimage[index] as File,
      ),
    );

    return allhiddenContact;
  }

  void addContact({
    required String name,
    required String number,
    required String email,
  }) {
    _allname = prefs.getStringList(_sfname) ?? [];
    _allcontact = prefs.getStringList(_sfcontact) ?? [];
    _allemail = prefs.getStringList(_sfemail) ?? [];
    // _allimage = prefs.getStringList(_sfimage) ?? [];

    _allname.add(name);
    _allcontact.add(number);
    _allemail.add(email);
    // _allimage.add(imageCache as String);

    prefs.setStringList(_sfname, _allname);
    prefs.setStringList(_sfcontact, _allcontact);
    prefs.setStringList(_sfemail, _allemail);
    // prefs.setStringList(_sfimage, _allimage);
  }

  void addHiddenContact({
    required String name,
    required String number,
    required String email,
    // required String imagePath,
  }) {
    _allhiddenname = prefs.getStringList(_sfhiddenname) ?? [];
    _allhiddencontact = prefs.getStringList(_sfhiddencontact) ?? [];
    _allhiddenemail = prefs.getStringList(_sfhiddenemail) ?? [];
    // _allhiddenimage = prefs.getStringList(_sfhiddenimage) ?? [];

    _allhiddenname.add(name);
    _allhiddencontact.add(number);
    _allhiddenemail.add(email);
    // _allhiddenimage.add(imagePath);

    prefs.setStringList(_sfhiddenname, _allhiddenname);
    prefs.setStringList(_sfhiddencontact, _allhiddencontact);
    prefs.setStringList(_sfhiddenemail, _allhiddenemail);
    // prefs.setStringList(_sfhiddenimage, _allhiddenimage);
  }

  void removeItem({required int index}) {
    _allname = prefs.getStringList(_sfname) ?? [];
    _allcontact = prefs.getStringList(_sfcontact) ?? [];
    _allemail = prefs.getStringList(_sfemail) ?? [];
    // _allimage = prefs.getStringList(_sfimage) ?? [];

    _allname.removeAt(index);
    _allcontact.removeAt(index);
    _allemail.removeAt(index);
    // _allimage.removeAt(index);

    prefs.setStringList(_sfname, _allname);
    prefs.setStringList(_sfcontact, _allcontact);
    prefs.setStringList(_sfemail, _allemail);
    // prefs.setStringList(_sfimage, _allimage);

    notifyListeners();
  }

  void removeHiddenItem({required int index}) {
    _allhiddenname = prefs.getStringList(_sfhiddenname) ?? [];
    _allhiddencontact = prefs.getStringList(_sfhiddencontact) ?? [];
    _allhiddenemail = prefs.getStringList(_sfhiddenemail) ?? [];
    // _allhiddenimage = prefs.getStringList(_sfhiddenimage) ?? [];

    _allhiddenname.removeAt(index);
    _allhiddencontact.removeAt(index);
    _allhiddenemail.removeAt(index);
    // _allhiddenimage.removeAt(index);

    prefs.setStringList(_sfhiddenemail, _allhiddenemail);
    // prefs.setStringList(_sfhiddenimage, _allhiddenimage);
    prefs.setStringList(_sfhiddencontact, _allhiddencontact);
    prefs.setStringList(_sfhiddenname, _allhiddenname);

    notifyListeners();
  }
}
