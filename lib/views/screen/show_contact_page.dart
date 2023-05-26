import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/views/components/all_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class showpage extends StatelessWidget {
  const showpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const mybackbutton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${MyStepper.allcontct[0]}"),
            Text("${MyStepper.allcontct[1]}"),
            Text("${MyStepper.allcontct[2]}"),

            CircleAvatar(
              foregroundImage: FileImage(
                MyStepper.allcontct[3],
              ),
              radius: 30,
            ),
            // Text("${}"),
          ],
        ),
      ),
    );
  }
}
