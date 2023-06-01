import 'package:af_provider_contact_diary_app/controllers/intro_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/list_preferences_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:af_provider_contact_diary_app/views/screen/add_contact_page.dart';
import 'package:af_provider_contact_diary_app/views/screen/contact_detail_page.dart';
import 'package:af_provider_contact_diary_app/views/screen/hidden_contact_page.dart';
import 'package:af_provider_contact_diary_app/views/screen/home_page.dart';
import 'package:af_provider_contact_diary_app/views/screen/intro_page.dart';
import 'package:af_provider_contact_diary_app/views/screen/show_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefsob = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => MyStepper(),
        ),
        ListenableProvider(
          create: (context) => Themechanger(),
        ),
        ListenableProvider(
          create: (context) => IntroProvider(prefsob: prefsob),
        ),
        ListenableProvider(
          create: (context) => ListController(prefs: prefsob),
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

      initialRoute: Provider.of<IntroProvider>(context).FirstTime
          ? allroutes.IntroPage
          : allroutes.homepage,

      // initialRoute: Provider.of<IntroProvider>(context).checkFirstTime()
      //     ? allroutes.IntroPage
      //     : allroutes.homepage,
      // initialRoute: allroutes.IntroPage,
      routes: {
        allroutes.homepage: (context) => const home_page(),
        allroutes.AddContactPage: (context) => add_contact_page(),
        allroutes.showpage: (context) => const showpage(),
        allroutes.Detiail: (context) => const detail_contact(),
        allroutes.IntroPage: (context) => const intro_page(),
        allroutes.HiddenContactPage: (context) => const hidden_contact_page(),
      },
    );
  }
}
