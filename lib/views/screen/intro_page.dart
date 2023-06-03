import 'dart:async';
import 'package:af_provider_contact_diary_app/controllers/intro_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

// ignore: camel_case_types
class intro_page extends StatelessWidget {
  const intro_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      Provider.of<IntroProvider>(context, listen: false).DoneIntroScreen();
      Navigator.of(context).pushReplacementNamed(allroutes.homepage);
      timer.cancel();
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://icon-library.com/images/animated-icon-gif/animated-icon-gif-13.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Step 1. Add Contact",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const Text(
              "Step 2. Select Hidden / Public",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const Text(
              "Step 3. Show In The Contact Page",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SlideAction(
                animationDuration: const Duration(seconds: 1),
                text: "Swipe Right",
                elevation: 15,
                outerColor: Colors.blue,

                onSubmit: () {
                  Navigator.of(context)
                      .pushReplacementNamed(allroutes.homepage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
