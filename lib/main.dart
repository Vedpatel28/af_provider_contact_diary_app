import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/screen/add_contact_page.dart';
import 'package:af_provider_contact_diary_app/views/screen/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => MyStepper(
            // name: null,
            // email: null,
            // image: null,
            // contact: null,
          ),
        ),
        ListenableProvider(
          create: (context) => Themechanger(),
        ),
      ],
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) =>
      child: const MyApp(),
    ),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(40, 20),
            ),
          ),
          backgroundColor: Colors.black26,
          titleTextStyle: GoogleFonts.varta(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: Colors.black,
            letterSpacing: 1,
            shadows: [
              const Shadow(
                color: Colors.black87,
                offset: Offset(1, 2),
                blurRadius: 5,
              ),
            ],
          ),
          centerTitle: true,
        ),
      ),

      // dark Theme Mode Code

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.white12,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(40, 20),
            ),
          ),
          titleTextStyle: GoogleFonts.varta(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            letterSpacing: 1,
            shadows: [
              const Shadow(
                color: Colors.white,
                offset: Offset(1, 2),
                blurRadius: 5,
              ),
            ],
          ),
          centerTitle: true,
        ),
      ),

      themeMode: Provider.of<Themechanger>(context).themechange
          ? ThemeMode.dark
          : ThemeMode.light,

      routes: {
        allroutes.homepage: (context) => const home_page(),
        allroutes.AddContactPage: (context) => add_contact_page(),
      },
    );
  }
}
