import 'dart:io';

import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
        actions: [
          // onLongPress: () async {
          //   print("Long Pressed.....");
          //   LocalAuthentication auth = LocalAuthentication();
          //
          //   bool done = await auth.authenticate(
          //     localizedReason: "Open to access hidden contacts !!",
          //   );
          //
          //   if (done) {
          //     // ignore: use_build_context_synchronously
          //     Navigator.of(context).pushNamed(allroutes.HiddenContactPage);
          //   }
          // },
          // onTap: () {
          //   Provider.of<Themechanger>(context, listen: false).themechange;
          // },
          IconButton(
            onPressed: () {
              Provider.of<Themechanger>(context, listen: false).changetheme();
            },
            icon: Icon(
              size: 25,
              Provider.of<Themechanger>(context).themechange
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
          PopupMenuButton(
            offset: const Offset(0, 50),
            onSelected: (val) async {

              if (val == allroutes.HiddenContactPage) {
                LocalAuthentication auth = LocalAuthentication();

                bool done = await auth.authenticate(
                  localizedReason: "Open hidden contacts !!",
                );
                if (done) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamed(allroutes.HiddenContactPage);
                }
              } else {
                Navigator.of(context).pushNamed(val);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: allroutes.AddContactPage,
                child: const Text("Add Contact Page"),
              ),
              PopupMenuItem(
                value: allroutes.HiddenContactPage,
                child: const Text("Hidden Contact Pag"),
              ),
              PopupMenuItem(
                value: allroutes.Detiail,
                child: const Text("Show Contact Pag"),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: Provider.of<ListController>(context).allContact.length,
        itemBuilder: (context, index) => Scrollbar(
          child: ListTile(
            leading: CircleAvatar(
              radius: 50,
              foregroundImage:
                  FileImage(File(Provider.of<ListController>(context).allhiddenContact[index].trimage as String),),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(allroutes.Detiail, arguments: index);
            },
            // title: Text(
            //   "${allglobalvar.ListOfContact[index].trname}",
            // ),
            title: Text(
              "${Provider.of<ListController>(context).allhiddenContact[index].trname}",
            ),
            // subtitle: Text(
            //   "+91 ${allglobalvar.ListOfContact[index].trcontact}",
            // ),
            subtitle: Text(
              "+91 ${Provider.of<ListController>(context).allhiddenContact[index].trcontact}",
            ),
            // trailing: IconButton(
            // onPressed: () {
            //   Uri call = Uri(
            //     scheme: 'tel',
            //     path: allGlobalvar.allContact[index].Contact,
            //   );
            //   launchUrl(call);
            // },
            // icon: const Icon(
            //   Icons.phone,
            //   color: Colors.green,
            // ),
            // ),
          ),
        ),
      ),
      // ListTile(
      //   leading: CircleAvatar(
      //     radius: 50,
      //     foregroundImage: FileImage(Provider.of<ListController>(context)
      //         .allContact[index]
      //         .trimage!),
      //   ),
      //   onTap: () {
      //     Navigator.of(context)
      //         .pushNamed(allroutes.Detiail, arguments: index);
      //   },
      //   title: Text(
      //     "${Provider.of<ListController>(context).allContact[index].trname}",
      //   ),
      //   subtitle: Text(
      //     "+91 ${Provider.of<ListController>(context).allContact[index].trcontact}",
      //   ),
      //   // trailing: IconButton(
      //   // onPressed: () {
      //   //   Uri call = Uri(
      //   //     scheme: 'tel',
      //   //     path: allGlobalvar.allContact[index].Contact,
      //   //   );
      //   //   launchUrl(call);
      //   // },
      //   // icon: const Icon(
      //   //   Icons.phone,
      //   //   color: Colors.green,
      //   // ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(allroutes.AddContactPage);
        },
        child: const Icon(
          Icons.navigate_next_rounded,
        ),
      ),
    );
  }
}
