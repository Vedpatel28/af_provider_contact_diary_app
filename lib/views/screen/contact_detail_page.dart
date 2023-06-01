import 'dart:io';
import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class detail_contact extends StatelessWidget {
  const detail_contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indexol = ModalRoute.of(context)!.settings.arguments as int;
    // int indexol = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<ListController>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: allglobalvar.ListOfContact.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                foregroundImage: FileImage(
                  // File(provider.allhiddenContact[index].imagePath),
                  File(provider.allContact[indexol].trimage as String),
                ),
              ),
              title: Text("${provider.allContact[indexol].trname}"),
              subtitle: Text("${provider.allContact[indexol].trcontact}"),
            ),
          ),
        ),
      ),
    );
  }
}
