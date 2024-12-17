import 'dart:io';

import 'package:flukit/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minelibs2/screens/HomeScreen.dart';
import 'package:minelibs2/screens/auth/LoginScreen.dart';
import 'package:minelibs2/screens/started/GetStartedScreen.dart';
import 'package:minelibs2/utils/app.utils.dart';

// Fix certificate verify issue
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bool isSplashShow = false;

  getSplashShow() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isSplashShow == prefs.getBool('isSplashShow')!;
          print('state of $isSplashShow');

  }

  @override
  void initState() {
    super.initState();
    getSplashShow();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minelibs',
      home: isSplashShow == false ? GetStartedScreen() : HomeScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
            bodyLarge: GoogleFonts.roboto(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            bodyMedium: GoogleFonts.roboto(color: Colors.white),
            displayLarge: GoogleFonts.roboto(
                color: Colors.orange,
                fontSize: 25,
                fontWeight: FontWeight.bold),
            displayMedium: GoogleFonts.roboto(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            displaySmall: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
            headlineMedium:
                GoogleFonts.roboto(color: Colors.white, fontSize: 14),
            headlineSmall:
                GoogleFonts.roboto(color: promoteColor, fontSize: 14)),
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
