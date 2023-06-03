import 'dart:io';

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
        title: const Text("Hidden Contact"),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<ListController>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: provider.getAllHiddenContacts.length,
            itemBuilder: (context, index) => ListTile(
              // leading: CircleAvatar(
              //   // foregroundImage: FileImage(
              //   //   File(provider.allhiddenContact[index].trimage! as String),
              //   // ),
              // ),
              title: Text(provider.getAllHiddenContacts[index].trname!),
              subtitle: Text(provider.getAllHiddenContacts[index].trcontact!),
            ),
          ),
        ),
      ),
    );
  }
}
