import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/components/all_back_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        const Icon(Icons.add, color: Colors.transparent),
      ],

    ),

      // body: Center(child: Column(
      //   children: [
      //    Text("${Provider.of<MyStepper>(context).allcontct[1]}"),
      //    Text("${Provider.of<MyStepper>(context).contact}"),
      //    Text("${Provider.of<MyStepper>(context).email}"),
      //   ],
      // )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(allroutes.AddContactPage);
        },
        child: const Icon(
          Icons.navigate_next_rounded,
        ),
      ),
    );
  }
}
