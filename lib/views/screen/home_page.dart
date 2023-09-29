import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.transparent,
        ),
        title: const Text(
          "Home Page",
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(allroutes.AddContactPage);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
