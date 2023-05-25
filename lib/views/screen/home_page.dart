import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
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
              Provider.of<Themechanger>(context).themechange ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<MyStepper>(
          builder: (context, provider, widget) => Stepper(
            currentStep: provider.steppercounte,
            onStepContinue: () {
              provider.stepperup();
            },
            onStepCancel: () {
              provider.stepperdoun();
            },
            steps: <Step>[
              Step(
                isActive: true,
                title: const Text("Add Image"),
                content: Container(),
              ),
              Step(
                isActive: true,
                title: const Text("Name"),
                content: Container(),
              ),
              Step(
                isActive: true,
                title: const Text("Contact"),
                content: Container(),
              ),
              Step(
                isActive: true,
                title: const Text("E-mail"),
                content: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
