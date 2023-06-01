import 'package:af_provider_contact_diary_app/views/modals/modals_class.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListController extends ChangeNotifier {
  SharedPreferences prefsob;

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

  ListController({required this.prefsob});

  List<AllContact> get getAllContact {
    _allname = prefsob.getStringList(_sfname) ?? [];
    _allname = prefsob.getStringList(_sfcontact) ?? [];
    _allname = prefsob.getStringList(_sfemail) ?? [];

    // allHiddenContacts = List.generate(
    //   _allHiddenNumbers.length,
    //       (index) => Contact(
    //     name: _allHiddenNames[index],
    //     number: _allHiddenNumbers[index],
    //     imagePath: _allHiddenImages[index],
    //   ),
    // );

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
    _allhiddenname = prefsob.getStringList(_sfhiddenname) ?? [];
    _allcontact = prefsob.getStringList(_sfhiddencontact) ?? [];
    _allhiddenimage = prefsob.getStringList(_sfhiddenimage) ?? [];

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

  void addContact({required String name, required String number, required String imagePath, required String email}) {
    _allname = prefsob.getStringList(_sfname) ?? [];
    _allcontact = prefsob.getStringList(_sfcontact) ?? [];
    _allemail = prefsob.getStringList(_sfemail) ?? [];
    _allimage = prefsob.getStringList(_sfimage) ?? [];

    _allname.add(name);
    _allcontact.add(number);
    _allimage.add(imagePath);
    _allemail.add(email);

    prefsob.setStringList(_sfname, _allname);
    prefsob.setStringList(_sfcontact, _allcontact);
    prefsob.setStringList(_sfimage, _allimage);
    prefsob.setStringList(_sfemail, _allemail);
  }

  void addHiddenContact({required String name, required String number, required String imagePath, required String email}) {
    _allhiddenname = prefsob.getStringList(_sfhiddenname) ?? [];
    _allhiddencontact = prefsob.getStringList(_sfhiddencontact) ?? [];
    _allhiddenemail = prefsob.getStringList(_sfhiddenemail) ?? [];
    _allhiddenimage = prefsob.getStringList(_sfhiddenimage) ?? [];

    _allhiddenname.add(name);
    _allhiddencontact.add(number);
    _allhiddenimage.add(imagePath);
    _allhiddenemail.add(email);

    prefsob.setStringList(_sfhiddenname, _allhiddenname);
    prefsob.setStringList(_sfhiddencontact, _allhiddencontact);
    prefsob.setStringList(_sfhiddenimage, _allhiddenimage);
    prefsob.setStringList(_sfhiddenemail, _allhiddenemail);
  }

  void removeItem({required int index}) {
    _allname = prefsob.getStringList(_sfname) ?? [];
    _allcontact = prefsob.getStringList(_sfcontact) ?? [];
    _allemail = prefsob.getStringList(_sfemail) ?? [];
    _allimage = prefsob.getStringList(_sfimage) ?? [];

    _allname.removeAt(index);
    _allimage.removeAt(index);
    _allcontact.removeAt(index);
    _allemail.removeAt(index);

    prefsob.setStringList(_sfname, _allname);
    prefsob.setStringList(_sfcontact, _allcontact);
    prefsob.setStringList(_sfimage, _allimage);
    prefsob.setStringList(_sfemail, _allemail);

    notifyListeners();
  }

  void removehiddenItem({required int index}) {
    _allhiddenname = prefsob.getStringList(_sfhiddenname) ?? [];
    _allhiddencontact = prefsob.getStringList(_sfhiddencontact) ?? [];
    _allhiddenemail = prefsob.getStringList(_sfhiddenemail) ?? [];
    _allhiddenimage = prefsob.getStringList(_sfhiddenimage) ?? [];

    _allhiddenname.removeAt(index);
    _allhiddenimage.removeAt(index);
    _allhiddencontact.removeAt(index);
    _allhiddenemail.removeAt(index);

    prefsob.setStringList(_sfhiddenemail, _allhiddenemail);
    prefsob.setStringList(_sfhiddenimage, _allhiddenimage);
    prefsob.setStringList(_sfhiddencontact, _allhiddencontact);
    prefsob.setStringList(_sfhiddenname, _allhiddenname);

    notifyListeners();
  }
}
