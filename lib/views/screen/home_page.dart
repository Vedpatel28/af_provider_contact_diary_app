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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stepper(
          currentStep: Provider.of<MyStepper>(context).steppercounte,
          onStepContinue: () {
            Provider.of<MyStepper>(context).stepperup();
          },
          steps: <Step>[
            Step(
              isActive: true,
              title: const Text("ved"),
              content: SizedBox(
                height: s.height * 0.02,
                width: s.width * 0.05,
                child: const Text("All"),
              ),
            ),
            Step(
              isActive: true,
              title: const Text("Samir"),
              content: SizedBox(
                height: s.height * 0.02,
                width: s.width * 0.02,
                child: const Text("All"),
              ),
            ),
            Step(
              isActive: true,
              title: const Text("HK"),
              content: SizedBox(
                height: s.height * 0.02,
                width: s.width * 0.02,
                child: const Text("All"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
