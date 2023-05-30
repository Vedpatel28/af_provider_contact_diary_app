import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/components/all_back_button.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class showpage extends StatelessWidget {
  const showpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Provider.of<Themechanger>(context).themechange ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
          const Icon(Icons.add, color: Colors.transparent),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 2 / 4,
              crossAxisCount: 2,
            ),
            itemCount: allglobalvar.ListOfContact.length,
            itemBuilder: (context, index) => Column(
              children: [
                Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(allroutes.homepage, arguments: index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.primaries[index % 18].shade100,
                        image: DecorationImage(
                          image: FileImage(allglobalvar.ListOfContact[index].trimage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Text(
                              "${allglobalvar.ListOfContact[index].trname}",
                            ),
                            const Spacer(),
                          ],
                        ),
                        Text(
                          "+91 ${allglobalvar.ListOfContact[index].trcontact}",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ListView.builder(
      //   padding: EdgeInsets.zero,
      //   itemCount: allglobalvar.ListOfContact.length,
      //   itemBuilder: (context, index) => Scrollbar(
      //     child: ListTile(
      //       leading: CircleAvatar(
      //         radius: 50,
      //         foregroundImage:
      //             // FileImage(allglobalvar.ListOfContact[index].trimage!),
      //         FileImage(allglobalvar.image!),
      //       ),
      //       title: Text(
      //         "${allglobalvar.ListOfContact[index].trname} ${allglobalvar.ListOfContact[index].tremail} ",
      //       ),
      //       subtitle: Text(
      //         "+91 ${allglobalvar.ListOfContact[index].trcontact}",
      //       ),
      //       trailing: IconButton(
      //         onPressed: () {
      //           Uri call = Uri(
      //             scheme: 'tel',
      //             path: allglobalvar.ListOfContact[index].trcontact,
      //           );
      //           // launchUrl(call);
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: Colors.green,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
