import 'dart:io';

import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class detail_contact extends StatelessWidget {
  const detail_contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indexa = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<ListController>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: provider.allContact.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                foregroundImage: FileImage(
                  // File(provider.allhiddenContact[index].imagePath),
                  File(provider.allContact[indexa].trimage as String),
                ),
              ),
              title: Text("${provider.allContact[indexa].trname}"),
              subtitle: Text("${provider.getAllContact[indexa].trcontact}"),
            ),
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(12),
      //   child: GridView.builder(
      //     gridDelegate:
      //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: indexa),
      //     itemBuilder: (context, index) => Column(
      //       children: [
      //         Expanded(
      //           flex: 1,
      //           child: Container(
      //             alignment: Alignment.center,
      //             child: Column(
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     const Spacer(),
      //                     Text(
      //                       "${allglobalvar.ListOfContact[index].trname}",
      //                     ),
      //                     const Spacer(),
      //                   ],
      //                 ),
      //                 Text(
      //                   "+91 ${allglobalvar.ListOfContact[index].trcontact}",
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
