import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const appName = 'MineLibs';
Color bgWhite = const Color.fromARGB(255, 250, 249, 249);
Color cardColor = Color.fromARGB(255, 24, 24, 24);
Color buttonColor = Color.fromARGB(255, 24, 24, 24);
Color inputColorBlack = Color.fromARGB(192, 17, 17, 17);

Color promoteColor = const Color(0xff7d52eb);
bool hasNotification = true;

defaultVerticalSpacer(BuildContext context) {
  return screenHeight(context) * .02;
}

// double defaultSpacer = screenHeight(context)
// Color bgWhiteButton = Co
TextTheme primaryTextTheme =
    GoogleFonts.poppinsTextTheme(Typography.blackRedmond);

double screenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

splashShow() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isSplashShow', true);
  print('change ${prefs.getBool('isSplashShow')}');
}

/* 
Future<Color> getDominantColor(String imageUrl) async {
  // Charger l'image depuis l'URL
  final response = await http.get(Uri.parse(imageUrl));
  final image = img.decodeImage(response.bodyBytes);

  // Vérifier si l'image a été chargée
  if (image == null) {
    return Colors.grey; // Couleur par défaut en cas d'erreur
  }

  // Compter les pixels de couleur
  final Map<int, int> colorCount = {};
  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width; x++) {
      final pixel = image.getPixel(x, y);
      colorCount[pixel] = (colorCount[pixel] ?? 0) + 1;
    }
  }

  // Trouver la couleur dominante
  int dominantColor = colorCount.keys.first;
  int maxCount = 0;
  colorCount.forEach((color, count) {
    if (count > maxCount) {
      maxCount = count;
      dominantColor = color;
    }
  });

  // Retourner la couleur dominante
  return Color(dominantColor);
} */
