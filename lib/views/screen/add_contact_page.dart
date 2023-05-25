import 'dart:io';
import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
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
                              foregroundImage: provider.image != null
                                  ? FileImage(provider.image!)
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
                              textInputAction: TextInputAction.next,
                              initialValue: provider.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Name";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                provider.name == newValue;
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter Name",
                                border: UnderlineInputBorder(),
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
                              initialValue: (provider.contact == null)
                                  ? null
                                  : provider.contact.toString(),
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
                                provider.contact == newValue;
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter Contact",
                                border: UnderlineInputBorder(),
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
                              initialValue: provider.email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Email";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (newValue) {
                                provider.email == newValue;
                              },
                              onFieldSubmitted: (value) {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  // provider.allcontct.add(
                                    // MyStepper(
                                    //   name: provider.name!,
                                    //   email: provider.email!,
                                    //   image: provider.image!,
                                    //   contact: provider.contact!,
                                    // ),
                                  // );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Successfully validated !!",
                                        selectionColor: Colors.green,
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).pop();
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
