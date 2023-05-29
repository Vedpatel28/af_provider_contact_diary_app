import 'dart:async';
import 'package:af_provider_contact_diary_app/controllers/intro_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class intro_page extends StatelessWidget {
  const intro_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (!Provider.of<IntroProvider>(context).checkFirstTime()) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.of(context).pushReplacementNamed(allroutes.homepage);
    //   });
    // }

    if (!Provider.of<IntroProvider>(context).checkFirstTime()) {
      Timer.periodic(const Duration(seconds: 10), (timer) {
        Navigator.of(context).pushNamed(allroutes.homepage);
        timer.cancel();
      });
    } else {
      Navigator.of(context).pushNamed(allroutes.homepage);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Spacer(),
            const FlutterLogo(
              size: 240,
            ),
            const Text("Made with Provider in Flutter"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                child: SlideAction(
                  onSubmit: () {
                    Navigator.of(context)
                        .pushReplacementNamed(allroutes.homepage);
                  },
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
