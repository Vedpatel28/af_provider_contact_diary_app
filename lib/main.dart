import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // dark Theme Mode Code

      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(50, 50),
              ),
            ),
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
            centerTitle: true),
      ),

      // dark Theme Mode Code

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routes: {
        allroutes.homepage: (context) => const home_page(),
      },
    );
  }
}
