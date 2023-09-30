import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/components/all_back_button.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class showpage extends StatelessWidget {
  const showpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int indexa = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: const mybackbutton(),
        title: const Text("Contect"),
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
          const Icon(Icons.add, color: Colors.transparent),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<ListController>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: provider.getAllContact.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(allroutes.Detiail, arguments: index);
              },
              child: ListTile(
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
                title: Text(provider.getAllContact[index].trname!),
                subtitle: Text(provider.getAllContact[index].trcontact!),
                trailing: IconButton(
                  onPressed: () {
                    Uri call = Uri(
                      scheme: 'tel',
                      path: provider.getAllContact[index].trcontact,
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
      ),
    );
  }
}
