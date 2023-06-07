import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
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
                      pro.removehiddenItem(index: index);
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

      // Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: GridView.builder(
      //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisSpacing: 5,
      //         mainAxisSpacing: 5,
      //         childAspectRatio: 2 / 4,
      //         crossAxisCount: 2,
      //       ),
      //       itemCount: allglobalvar.ListOfContact.length,
      //       itemBuilder: (context, index) => Column(
      //         children: [
      //           Expanded(
      //             flex: 5,
      //             child: Container(
      //               decoration: const BoxDecoration(
      //                   color: Colors.blueAccent,
      //                   image: DecorationImage(
      //                     image: NetworkImage(
      //                       "https://icon-library.com/images/animated-icon-gif/animated-icon-gif-13.jpg",
      //                     ),
      //                     fit: BoxFit.cover,
      //                   )
      //                   // image: DecorationImage(
      //                   //   image: FileImage(Provider.of<ListController>(context)
      //                   //       .getAllHiddenContacts[index]
      //                   //       .trimage!),
      //                   //   fit: BoxFit.cover,
      //                   // ),
      //                   ),
      //             ),
      //           ),
      //           Expanded(
      //             flex: 2,
      //             child: Container(
      //               alignment: Alignment.center,
      //               child: Column(
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       const Spacer(),
      //                       Text(
      //                         "${Provider.of<ListController>(context).getAllContact[index].trname}",
      //                       ),
      //                       const Spacer(),
      //                       Text(
      //                         "${Provider.of<ListController>(context).getAllContact[index].trcontact}",
      //                       ),
      //                       const Spacer(),
      //                     ],
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Container(
      //                       width: double.infinity,
      //                       height: 30,
      //                       child: IconButton(
      //                         onPressed: () {
      //                           Uri call = Uri(
      //                             scheme: 'tel',
      //                             path: Provider.of<ListController>(context)
      //                                 .getAllContact[index]
      //                                 .trcontact,
      //                           );
      //                           launchUrl(call);
      //                         },
      //                         icon: const Icon(
      //                           Icons.phone,
      //                           color: Colors.green,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   // Text(
      //                   //   "+91 "
      //                   //   "${Provider.of<ListController>(context).getAllHiddenContacts[index].trcontact}",
      //                   // ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
// Padding(
//   padding: const EdgeInsets.all(20),
//   child: Container(
//     height: 300,
//     width: double.infinity,
//     color: Colors.grey,
//     child: Column(
//       children: [
//         Container(
//           height: 200,
//           width: 120,
//           color: Colors.black26,
//         ),
//         Consumer<ListController>(
//           builder: (context, provider, child) => Container(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5,
//                 childAspectRatio: 2 / 4,
//                 crossAxisCount: 2,
//               ),
//               itemCount: allglobalvar.ListOfContact.length,
//               itemBuilder: (context, index) => Column(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context)
//                             .pushNamed(allroutes.Detiail, arguments: index);
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             // image: FileImage(
//                             //     provider.allContact[index].trimage!),
//                             image: FileImage(
//                                 allglobalvar.image!),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               const Spacer(),
//                               // Text(
//                               //   "${provider.allContact[index].trname}",
//                               // ),
//                               Text(
//                                 "${allglobalvar.name}",
//                               ),
//                               const Spacer(),
//                             ],
//                           ),
//                           // Text(
//                           //   "+91 ${provider.allContact[index].trcontact}",
//                           //   style: const TextStyle(
//                           //     color: Colors.black,
//                           //     fontSize: 30
//                           //   ),
//                           // ),
//                           Text(
//                             "+91 ${allglobalvar.contact}",
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 30
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           //     ListTile(
//           //   // leading: CircleAvatar(
//           //   //   foregroundImage: FileImage(
//           //   //     // File(provider.allhiddenContact[index].imagePath),
//           //   //     File(provider.allContact[indexa].trimage as String),
//           //   //   ),
//           //   // ),
//           //   title: Text("${provider.allContact[index].trname}"),
//           //   subtitle: Text("${provider.allContact[index].trcontact}"),
//           // ),
//           // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           //   crossAxisCount: provider.allContact.length,
//         ),
//       ],
//     ),
//   ),
// ),

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
