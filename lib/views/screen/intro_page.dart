import 'dart:async';
import 'package:af_provider_contact_diary_app/controllers/intro_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class intro_page extends StatelessWidget {
  const intro_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 8), (timer) {
      Provider.of<IntroProvider>(context, listen: false).DoneIntroScreen();
      Navigator.of(context).pushReplacementNamed(allroutes.homepage);
      timer.cancel();
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Intro Screen",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
