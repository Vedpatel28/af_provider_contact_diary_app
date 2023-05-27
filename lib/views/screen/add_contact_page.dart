import 'dart:io';
import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/components/all_back_button.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:af_provider_contact_diary_app/views/modals/modals_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class add_contact_page extends StatelessWidget {
  add_contact_page({Key? key}) : super(key: key);

  List<GlobalKey<FormState>> formkey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  Widget build(BuildContext context) {
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
              Provider
                  .of<Themechanger>(context)
                  .themechange
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
          const Icon(Icons.add, color: Colors.transparent),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Consumer<MyStepper>(
            builder: (context, provider, widget) =>
                Stepper(
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
                                builder: (context) =>
                                    AlertDialog(
                                      title: const Text("Chose Method"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            ImagePicker picker = ImagePicker();
                                            XFile? img = await picker.pickImage(
                                                source: ImageSource.camera);

                                            if (img != null) {
                                              provider.imageset(
                                                  img: File(img.path));
                                            }
                                            // ignore: use_build_context_synchronously
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
                                              provider.imageset(
                                                  img: File(img.path));
                                            }
                                            // ignore: use_build_context_synchronously
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
                          Form(
                            key: formkey[0],
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            child: Column(
                              children: [
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  initialValue: allglobalvar.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter First Name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (newValue) {
                                    allglobalvar.name = newValue;
                                    provider.aftervalidat();
                                  },
                                  // onFieldSubmitted: (value) {
                                  //   if (formkey[0].currentState!.validate()) {
                                  //     formkey[0].currentState!.save();
                                  //     allglobalvar.ListOfContact.add(
                                  //       AllContact(),
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
                          Form(
                            key: formkey[1],
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            child: Column(
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
                                    allglobalvar.contact = newValue;
                                    provider.aftervalidat();
                                  },
                                  // onFieldSubmitted: (value) {
                                  //   if (formkey[1].currentState!.validate()) {
                                  //     formkey[1].currentState!.save();
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
                          Form(
                            key: formkey[2],
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            child: Column(
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
                                    allglobalvar.email = newValue;
                                  },
                                  onFieldSubmitted: (value) {
                                    if (formkey[2].currentState!.validate() &&
                                        formkey[1].currentState!.validate() &&
                                        formkey[0].currentState!.validate()) {
                                      formkey[2].currentState!.save();
                                      formkey[1].currentState!.save();
                                      formkey[0].currentState!.save();
                                      allglobalvar.ListOfContact.add(
                                        AllContact(
                                          trname: allglobalvar.name,
                                          trcontact: allglobalvar.contact,
                                          trimage: allglobalvar.image,
                                          tremail: allglobalvar.email,
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text("Suceessful"),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text("Error"),
                                        ),
                                      );
                                    }
                                    Navigator.of(context)
                                        .pushNamed(allroutes.showpage);
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "E-Mail",
                                    errorBorder: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      isActive: provider.isActiveannabelle(index: 3),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
