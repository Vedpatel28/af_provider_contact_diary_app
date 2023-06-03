
import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class hidden_contact_page extends StatelessWidget {
  const hidden_contact_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hidden Contact"),
        actions: [
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<ListController>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: provider.getAllHiddenContacts.length,
            itemBuilder: (context, index) => ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://miro.medium.com/v2/resize:fit:1400/1*zHtmoxeiEJ7btMX6CDgECg.gif",
                    ),
                     // scale: 0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // leading: CircleAvatar(
              //   foregroundImage: FileImage(
              //     File(provider.allhiddenContact[index].trimage! as String),
              //   ),
              // ),
              title: Text(provider.getAllHiddenContacts[index].trname!),
              subtitle: Text(provider.getAllHiddenContacts[index].trcontact!),
              trailing: IconButton(
                onPressed: () {
                  Uri call = Uri(
                    scheme: 'tel',
                    path: provider.getAllHiddenContacts[index].trcontact,
                  );
                  launchUrl(call);
                },
                icon: const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
