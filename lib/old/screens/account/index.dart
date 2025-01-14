import 'dart:convert';

import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minelibs2/old/utils/app.utils.dart';
import 'package:http/http.dart' as http;

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _location = "...";

  Future<void> _getCurrentLocation() async {
    print('start');
    try {
      // Vérifier et demander les permissions
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _location = "Service de localisation désactivé";
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _location = "Permission de localisation refusée";
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _location = "Permission de localisation refusée en permanence";
        });
        return;
      }

      // Obtenir les coordonnées
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Appeler le service de géocodage de Nominatim
      String url =
          "https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${position.latitude}&lon=${position.longitude}";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String city = data['address']['city'] ?? 'Inconnue';
        String country = data['address']['country'] ?? 'Pays inconnu';
        setState(() {
          _location = "$city, $country";
        });
      } else {
        setState(() {
          _location = "Erreur lors du géocodage";
        });
      }
    } catch (e) {
      setState(() {
        _location = "Erreur : $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * .33,
              width: screenWidth(context),
              padding: EdgeInsets.all(screenHeight(context) * .04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                gradient: LinearGradient(
                  colors: [
                    promoteColor.withOpacity(0.4),
                    promoteColor.withOpacity(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                spacing: defaultVerticalSpacer(context),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: defaultVerticalSpacer(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FluAvatar(
                        defaultAvatarType: FluAvatarTypes.memojis,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            _location,
                            style: GoogleFonts.roboto(
                                color: Colors.white.withOpacity(.4)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth(context) * .09,
                      ),
                      FluButton(
                          onPressed: () {},
                          backgroundColor: Colors.transparent,
                          child: FluIcon(
                            FluIcons.edit,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Tooltip(
                    message: 'Upgrade plan',
                    textStyle: GoogleFonts.roboto(color: Colors.black),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: FluButton(
                        onPressed: () {},
                        width: screenWidth(context) * .35,
                        padding: EdgeInsets.all(10),
                        backgroundColor: promoteColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Free Plan',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            FluIcon(
                              FluIcons.link,
                              color: Colors.white,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * .55,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: defaultVerticalSpacer(context),
                    children: [
                      FluButton(
                        onPressed: (){},
                        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
                        height: screenHeight(context) * .1,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Information Générale',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            FluIcon(FluIcons.arrowRight, color: Colors.white,)
                          ],
                        ),
                      ),
                      FluButton(
                        onPressed: (){},
                        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
                        height: screenHeight(context) * .1,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Service Client',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            FluIcon(FluIcons.arrowRight, color: Colors.white,)
                          ],
                        ),
                      ),
                      FluButton(
                        onPressed: (){},
                        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
                        height: screenHeight(context) * .1,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Comment ça marche',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            FluIcon(FluIcons.arrowRight, color: Colors.white,)
                          ],
                        ),
                      ),
                      FluButton(
                        onPressed: (){},
                        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
                        height: screenHeight(context) * .1,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'FAQ',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            FluIcon(FluIcons.arrowRight, color: Colors.white,)
                          ],
                        ),
                      ),
                      FluButton(
                        onPressed: (){},
                        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
                        height: screenHeight(context) * .1,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'A propos',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            FluIcon(FluIcons.arrowRight, color: Colors.white,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
