import 'dart:io';
import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/components/all_back_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class add_contact_page extends StatelessWidget {
  add_contact_page({Key? key}) : super(key: key);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
              Provider.of<Themechanger>(context).themechange
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
          const Icon(Icons.add, color: Colors.transparent),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<MyStepper>(
                  builder: (context, provider, widget) => Stepper(
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
                        isActive: provider.isActiveannabelle(index: 0),
                        state: provider.stepstate(index: 0),
                        title: const Text("Add Image"),
                        content: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              foregroundImage:  MyStepper.image != null
                                  ? FileImage(MyStepper.image!)
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
                      ),
                      Step(
                        isActive: provider.isActiveannabelle(index: 1),
                        state: provider.stepstate(index: 1),
                        title: const Text("Name"),
                        content: Stack(
                          children: [
                            TextFormField(
                              // textInputAction: TextInputAction.next,
                              // initialValue: allGlobalvar.Lname,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "Enter Last name";
                              //   } else {
                              //     return null;
                              //   }
                              // },
                              // onSaved: (newValue) {
                              //   allGlobalvar.Lname = newValue;
                              // },
                              textInputAction: TextInputAction.next,
                              initialValue: MyStepper.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Name";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                MyStepper.name == newValue;
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter Name",
                                border: UnderlineInputBorder(),
                                errorBorder: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        isActive: provider.isActiveannabelle(index: 2),
                        state: provider.stepstate(index: 2),
                        title: const Text("Contact"),
                        content: Stack(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              initialValue: (MyStepper.contact == null)
                                  ? null
                                  : MyStepper.contact.toString(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Contact";
                                } else if (value.length < 10) {
                                  return "Enter 10 Digits...";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                MyStepper.contact == newValue;
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter Contact",
                                border: UnderlineInputBorder(),
                                errorBorder: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        isActive: provider.isActiveannabelle(index: 3),
                        state: provider.stepstate(index: 3),
                        title: const Text("E-mail"),
                        content: Stack(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              initialValue: MyStepper.email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Email";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                MyStepper.email == newValue;
                              },
                              onFieldSubmitted: (value) {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  MyStepper.allcontct.add(MyStepper.name);
                                  MyStepper.allcontct.add(MyStepper.email);
                                  MyStepper.allcontct.add(MyStepper.contact);
                                  MyStepper.allcontct.add(MyStepper.image);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Successfully validated !!",
                                        selectionColor: Colors.green,
                                      ),
                                    ),
                                  );
                                  // ScaffoldMessenger.of(context)
                                  //     .showMaterialBanner(
                                  //   MaterialBanner(
                                  //     content: Container(height: 250),
                                  //     actions: [
                                  //       Text("Name : ${provider.allcontct[0]}"),
                                  //       Text(
                                  //           "E-mail : ${provider.allcontct[1]}"),
                                  //       Text(
                                  //           "Contact : ${provider.allcontct[2]}"),
                                  //     ],
                                  //   ),
                                  // );
                                  Navigator.of(context)
                                      .pushNamed(allroutes.showpage);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Failed to validate !!"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter E-mail",
                                border: UnderlineInputBorder(),
                                errorBorder: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
