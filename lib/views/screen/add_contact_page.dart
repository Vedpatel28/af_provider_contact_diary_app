// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/components/all_back_button.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:af_provider_contact_diary_app/views/modals/modals_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class add_contact_page extends StatelessWidget {
  add_contact_page({Key? key}) : super(key: key);

  String? _number;
  String? _name;
  String? _email;

  // String? _image;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int index =
        Provider.of<ListController>(context, listen: false).allContact.length;
    int indexhide = Provider.of<ListController>(context, listen: false)
        .allhiddenContact
        .length;

    // Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const mybackbutton(),
        title: const Text(
          "Add Contact",
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
          IconButton(
            onPressed: () async {
              // Directory? dir = await getExternalStorageDirectory();

              // File nImage = await Provider.of<MyStepper>(context, listen: false)
              //     .image!
              //     .copy("${dir!.path}/$_name.jpg");
              if (Provider.of<MyStepper>(context, listen: false).Hiddentrue) {
                Provider.of<ListController>(context, listen: false)
                    .addHiddenContact(
                        name: _name!,
                        number: _number!,
                        // imagePath: nImage.path,
                        email: _email!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Contact added"),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed(
                  allroutes.HiddenContactPage,
                  arguments: indexhide,
                );
              } else if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                Provider.of<ListController>(context, listen: false)
                    // addHiddenContact(name: _name!, number: _number!, imagePath: nImage.path);
                    .addContact(name: _name!, number: _number!, email: _email!);
                //     .add(
                //   AllContact(
                //     trname: _name,
                //     trcontact: _number,
                //     tremail: _email,
                //   ),
                // );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Suceessful"),
                  ),
                );
                Navigator.of(context)
                    .pushNamed(allroutes.Detiail, arguments: index);
                // provider.laststepdecrease();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Error"),
                  ),
                );
              }
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(allroutes.homepage);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Consumer<MyStepper>(
            builder: (context, provider, widget) => Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Stepper(
                currentStep: provider.steppercounte,
                onStepContinue: () {
                  provider.stepperup();
                },
                onStepCancel: () {
                  provider.stepperdoun();
                },
                onStepTapped: (index) {
                  provider.steptepped(index: index);
                },
                steps: <Step>[
                  Step(
                    state: provider.stepstate(index: 0),
                    title: Text(
                      "Add Image",
                      style: GoogleFonts.akayaKanadaka(),
                    ),
                    content: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          foregroundImage: allglobalvar.image != null
                              ? FileImage(allglobalvar.image!)
                              : null,
                          child: const Text("Add"),
                        ),
                        FloatingActionButton.small(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Chose Method"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      ImagePicker picker = ImagePicker();
                                      XFile? img = await picker.pickImage(
                                          source: ImageSource.camera);

                                      if (img != null) {
                                        provider.imageset(img: File(img.path));
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Camera 📷"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      ImagePicker picker = ImagePicker();
                                      XFile? img = await picker.pickImage(
                                          source: ImageSource.gallery);

                                      if (img != null) {
                                        provider.imageset(img: File(img.path));
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Gallery 🌌"),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    isActive: provider.isActiveannabelle(index: 0),
                  ),
                  Step(
                    state: provider.stepstate(index: 1),
                    title: Text(
                      "Name",
                      style: GoogleFonts.akayaKanadaka(),
                    ),
                    content: Stack(
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              initialValue: allglobalvar.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Name";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                _name = newValue;
                                // allglobalvar.name = newValue;
                              },
                              // onFieldSubmitted: (value) {
                              //   if (formkey.currentState!.validate()) {
                              //     formkey.currentState!.save();
                              //     allglobalvar.ListOfContact.add(
                              //       AllContact(trname: _name),
                              //     );
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //         content: Text("Suceessful"),
                              //       ),
                              //     );
                              //   } else {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //         content: Text("Error"),
                              //       ),
                              //     );
                              //   }
                              //   provider.aftervalidat();
                              // },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Name",
                                errorBorder: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isActive: provider.isActiveannabelle(index: 1),
                  ),
                  Step(
                    state: provider.stepstate(index: 2),
                    title: Text(
                      "Contact",
                      style: GoogleFonts.akayaKanadaka(),
                    ),
                    content: Stack(
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              maxLength: 10,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              initialValue: (allglobalvar.contact == null)
                                  ? null
                                  : allglobalvar.contact.toString(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Contect Number";
                                } else if (value.length < 10) {
                                  return "Enter 10 Digits...";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                _number = newValue;
                                allglobalvar.contact = newValue;
                              },
                              // onFieldSubmitted: (value) {
                              //   if (formkey.currentState!.validate()) {
                              //     formkey.currentState!.save();
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //         content: Text("Suceessful"),
                              //       ),
                              //     );
                              //   } else {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //         content: Text("Error"),
                              //       ),
                              //     );
                              //   }
                              //   provider.aftervalidat();
                              // },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "+91 9093839249",
                                errorBorder: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isActive: provider.isActiveannabelle(index: 2),
                  ),
                  Step(
                    state: provider.stepstate(index: 3),
                    title: Text(
                      "E-mail",
                      style: GoogleFonts.akayaKanadaka(),
                    ),
                    content: Stack(
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              initialValue: allglobalvar.email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter E-mail";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                _email = newValue;
                                allglobalvar.email = newValue;
                                print(
                                    "_number : ${_number} _name: ${_name}\n\nemail : ${allglobalvar.email} name : ${allglobalvar.name}");
                              },
                              onTap: () async {
                                // Directory? dir =
                                //     await getExternalStorageDirectory();
                                // File nImage = await provider.image!.copy(
                                //     "${dir!.path}/${allglobalvar.contact}.jpg");
                                if (provider.Hiddentrue) {
                                  Provider.of<ListController>(context)
                                      .addHiddenContact(
                                    name: allglobalvar.name!,
                                    number: allglobalvar.contact!,
                                    email: allglobalvar.email!,
                                    // imagePath: nImage.path,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Contact added"),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  Navigator.of(context).pop();
                                }
                              },
                              onFieldSubmitted: (value) {
                                // if (Provider.of<MyStepper>(context, listen: false).Hiddentrue) {
                                // Provider.of<ListController>(context, listen: false)
                                //     .addHiddenContact(
                                // name: _name!,
                                // number: _number!,
                                // // imagePath: nImage.path,
                                // email: _email!);
                                // ScaffoldMessenger.of(context).showSnackBar(
                                // const SnackBar(
                                // content: Text("Contact added"),
                                // behavior: SnackBarBehavior.floating,
                                // backgroundColor: Colors.green,
                                // duration: Duration(seconds: 2),
                                // ),
                                // );
                                // // Navigator.of(context).pop();
                                // Navigator.of(context).pushNamed(
                                // allroutes.HiddenContactPage,
                                // arguments: indexhide,
                                // );
                                // } else if (formkey.currentState!.validate()) {
                                // formkey.currentState!.save();
                                // Provider.of<ListController>(context, listen: false)
                                // // addHiddenContact(name: _name!, number: _number!, imagePath: nImage.path);
                                //     .addContact(name: _name!, number: _number!, email: _email!);
                                // //     .add(
                                // //   AllContact(
                                // //     trname: _name,
                                // //     trcontact: _number,
                                // //     tremail: _email,
                                // //   ),
                                // // );
                                // ScaffoldMessenger.of(context).showSnackBar(
                                // const SnackBar(
                                // content: Text("Suceessful"),
                                // ),
                                // );
                                // Navigator.of(context)
                                //     .pushNamed(allroutes.Detiail, arguments: index);
                                // // provider.laststepdecrease();
                                // } else {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                // const SnackBar(
                                // content: Text("Error"),
                                // ),
                                // );
                                // }
                                // Navigator.of(context).pop();
                                // // Navigator.of(context).pushNamed(allroutes.showpage);
                                // },

                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  allglobalvar.ListOfContact.add(
                                    AllContact(
                                      trname: allglobalvar.name,
                                      trcontact: allglobalvar.contact,
                                      trimage: allglobalvar.image,
                                      tremail: allglobalvar.email,
                                    ),
                                  );
                                  Provider.of<ListController>(context, listen: false)
                                      .addContact(
                                    name: _name!,
                                    number: _number!,
                                    email: _email!,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Suceessful"),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Error"),
                                    ),
                                  );
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "E-Mail",
                                errorBorder: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isActive: provider.isActiveannabelle(index: 3),
                  ),
                  Step(
                    title: const Text("Hidden"),
                    content: CheckboxListTile(
                      title: const Text("If You Hidde Contact Press This"),
                      value: Provider.of<MyStepper>(context).Hiddentrue,
                      onChanged: (value) {
                        Provider.of<MyStepper>(context, listen: false).hide();
                      },
                    ),
                    isActive: provider.isActiveannabelle(index: 4),
                    state: provider.stepstate(index: 4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // Padding(
      //   padding: const EdgeInsets.all(12),
      //   child: Consumer<MyStepper>(
      //     builder: (context, provider, child) => Stepper(
      //       currentStep: provider.steppercounte,
      //       onStepContinue: () {
      //         provider.stepperup();
      //       },
      //       onStepCancel: () {
      //         provider.stepperdoun();
      //       },
      //       onStepTapped: (index) {
      //         provider.steptepped(index: index);
      //       },
      //       controlsBuilder: (context, details) {
      //         return Padding(
      //           padding: const EdgeInsets.only(top: 20),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               ElevatedButton(
      //                 onPressed: () {
      //                   provider.stepperup();
      //                 },
      //                 child: const Text("Continue"),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   provider.stepperdoun();
      //                 },
      //                 child: const Text("Back"),
      //               ),
      //             ],
      //           ),
      //         );
      //       },
      //       steps: <Step>[
      //         Step(
      //           title: const Text("Add Image"),
      //           state: provider.stepstate(index: 0),
      //           content: Stack(
      //             alignment: Alignment.bottomRight,
      //             children: [
      //               CircleAvatar(
      //                 radius: 60,
      //                 foregroundImage: provider.image != null
      //                     ? FileImage(provider.image!)
      //                     : null,
      //                 child: const Text("Add Image"),
      //               ),
      //               FloatingActionButton.small(
      //                 onPressed: () {
      //                   showDialog(
      //                     context: context,
      //                     builder: (context) => AlertDialog(
      //                       title: const Text("Select the method"),
      //                       actions: [
      //                         ElevatedButton(
      //                           onPressed: () async {
      //                             ImagePicker picker = ImagePicker();
      //
      //                             XFile? img = await picker.pickImage(
      //                                 source: ImageSource.camera);
      //
      //                             if (img != null) {
      //                               provider.imageset(img: File(img.path));
      //                             }
      //                             Navigator.of(context).pop();
      //                           },
      //                           child: const Text("Camera"),
      //                         ),
      //                         ElevatedButton(
      //                           onPressed: () {},
      //                           child: const Text("Gallery"),
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 },
      //                 child: const Icon(Icons.add),
      //               ),
      //             ],
      //           ),
      //           isActive: provider.isActiveannabelle(index: 0),
      //         ),
      //         Step(
      //           title: const Text("Name"),
      //           content: TextField(
      //             onChanged: (val) {
      //               _name = val;
      //             },
      //             decoration: const InputDecoration(
      //               border: OutlineInputBorder(),
      //             ),
      //           ),
      //           isActive: provider.isActiveannabelle(index: 1),
      //           state: provider.stepstate(index: 1),
      //         ),
      //         Step(
      //           title: const Text("Contact"),
      //           content: TextField(
      //             keyboardType: TextInputType.number,
      //             maxLength: 10,
      //             onChanged: (val) {
      //               _number = val;
      //             },
      //             decoration: const InputDecoration(
      //               border: OutlineInputBorder(),
      //             ),
      //           ),
      //           isActive: provider.isActiveannabelle(index: 2),
      //           state: provider.stepstate(index: 2),
      //         ),
      //         Step(
      //           title: const Text("Email"),
      //           content: TextField(
      //             onChanged: (val) {
      //               _email = val;
      //             },
      //             decoration: const InputDecoration(
      //               border: OutlineInputBorder(),
      //             ),
      //           ),
      //           isActive: provider.isActiveannabelle(index: 3),
      //           state: provider.stepstate(index: 3),
      //         ),
      //         Step(
      //           title: const Text("Status"),
      //           content: CheckboxListTile(
      //             title: const Text("Check to make this contact hidden"),
      //             value: Provider.of<MyStepper>(context).Hiddentrue,
      //             onChanged: (val) {
      //               Provider.of<MyStepper>(context, listen: false).hide();
      //             },
      //           ),
      //           isActive: provider.isActiveannabelle(index: 4),
      //           state: provider.stepstate(index: 4),
      //         ),
      //       ],
      //     ),
      //   ),
      // )
    );
  }
}
