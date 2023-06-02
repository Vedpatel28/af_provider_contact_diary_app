import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class detail_contact extends StatelessWidget {
  const detail_contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                      Navigator.of(context)
                          .pushNamed(allroutes.Detiail, arguments: index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(Provider.of<ListController>(context)
                              .allContact[index]
                              .trimage!),
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
                              "${Provider.of<ListController>(context).allContact[index].trname}",
                            ),
                            const Spacer(),
                          ],
                        ),
                        Text(
                          "+91 ${Provider.of<ListController>(context).allContact[index].trcontact}",
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
    );
  }
}
