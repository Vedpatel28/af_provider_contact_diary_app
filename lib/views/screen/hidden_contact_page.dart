import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class hidden_contact_page extends StatelessWidget {
  const hidden_contact_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hidden Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: allglobalvar.ListOfContact.length,
          itemBuilder: (context, index) => ListTile(
            // leading: CircleAvatar(
            //   foregroundImage: FileImage(
            //     // File(provider.allhiddenContact[index].imagePath),
            //     File(provider.allhiddenContact[indexold].trimage as String),
            //   ),
            // ),
            title: Text(
                "${Provider.of<ListController>(context).allhiddenContact[index].trname}"),
            subtitle: Text(
                "${Provider.of<ListController>(context).allhiddenContact[index].trcontact}"),
          ),
        ),
      ),
    );
  }
}
