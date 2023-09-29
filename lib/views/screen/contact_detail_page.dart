import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class detail_contact extends StatelessWidget {
  const detail_contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
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
        padding: const EdgeInsets.all(5),
        child: Consumer<ListController>(
          builder: (context, pro, widget) => Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: s.width * 0.2, height: s.height * 0.2),
                  // CircleAvatar(
                  //   radius: 60,
                  //   foregroundImage: FileImage(.allContact[index].image!),
                  // ),
                  // SizedBox(width: s.width * 0.1),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      pro.removeHiddenItem(index: index);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: s.height * 0.03,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(allroutes.EditPage, arguments: index);
                    },
                    icon: Icon(
                      Icons.edit,
                      size: s.height * 0.028,
                    ),
                  ),
                ],
              ),
              SizedBox(height: s.height * 0.05),
              Text(
                "${pro.getAllHiddenContacts[index].trname} ${pro.getAllHiddenContacts[index].tremail}",
                style: TextStyle(
                  wordSpacing: 2,
                  fontSize: s.height * 0.04,
                ),
              ),
              SizedBox(height: s.height * 0.01),
              Row(
                children: [
                  SizedBox(width: s.width * 0.05),
                  Text(
                    "+91 ${pro.getAllHiddenContacts[index].trcontact}",
                    style: TextStyle(
                      fontSize: s.height * 0.028,
                    ),
                  ),
                ],
              ),
              SizedBox(height: s.height * 0.01),
              Container(
                height: 2,
                width: 360,
                color: Colors.grey,
              ),
              SizedBox(height: s.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Uri call = Uri(
                        scheme: 'tel',
                        path: pro.getAllHiddenContacts[index].trcontact,
                      );
                      launchUrl(call);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: s.height * 0.03,
                      child: const Icon(Icons.phone, color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Uri sms = Uri(
                        scheme: 'sms',
                        path: pro.getAllHiddenContacts[index].trcontact,
                      );
                      launchUrl(sms);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      radius: s.height * 0.03,
                      child: const Icon(Icons.message, color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Uri mail = Uri(
                        scheme: 'mailto',
                        query:
                            "subject=Contact us=Dear ${pro.getAllHiddenContacts[index].trname}",
                        path: pro.getAllHiddenContacts[index].tremail,
                      );
                      launchUrl(mail);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.shade300,
                      radius: s.height * 0.03,
                      child:
                          const Icon(Icons.email_rounded, color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Share.share(
                      //     "${pro.getAllHiddenContacts[index].trname} ${pro.getAllHiddenContacts[index].tremail} \n ${pro.getAllHiddenContacts[index].trcontact}");
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      radius: s.height * 0.03,
                      child: const Icon(Icons.share, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: s.height * 0.02),
              Container(
                height: 2,
                width: 360,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
