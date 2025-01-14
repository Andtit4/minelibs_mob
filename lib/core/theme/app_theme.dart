import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minelibs2/core/theme/colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.promoteColor,
    scaffoldBackgroundColor: AppColors.bgWhite,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.promoteColor,
      secondary: AppColors.buttonColor,
      error: AppColors.error,
    ),
    
    // Ajoutez d'autres personnalisations de thème ici
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.promoteColor,
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.roboto(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        bodyMedium: GoogleFonts.roboto(color: Colors.white),
        displayLarge: GoogleFonts.roboto(
            color: Colors.orange, fontSize: 25, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.roboto(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
        headlineMedium: GoogleFonts.roboto(color: Colors.white, fontSize: 14),
        headlineSmall:
            GoogleFonts.roboto(color: AppColors.promoteColor, fontSize: 14)),
    // Définissez vos couleurs pour le thème clair
  );
}
