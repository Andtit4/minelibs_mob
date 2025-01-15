import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minelibs2/core/bindings/initial_bindings.dart';
import 'package:minelibs2/core/theme/app_theme.dart';
import 'package:minelibs2/core/theme/colors.dart';
import 'package:minelibs2/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pages = await AppPages.getPages();

  runApp(
    GetMaterialApp(
      // locale: DevicePreview.locale(context),

      title: 'Minelibs',
      debugShowCheckedModeBanner: false,
      getPages: pages,
      initialRoute: AppPages.INITIAL,
      // darkTheme: AppTheme.darkTheme,
      initialBinding: InitialBindings(),
      theme: ThemeData(
        primaryColor: AppColors.promoteColor,
        scaffoldBackgroundColor: Colors.black,
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
            headlineSmall: GoogleFonts.roboto(
                color: AppColors.promoteColor, fontSize: 14)),
      ),
    ),
  );
}
