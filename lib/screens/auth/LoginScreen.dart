import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/partials/bottom_nav.dart';
import 'package:minelibs2/screens/HomeScreen.dart';
import 'package:minelibs2/utils/app.utils.dart';
import 'package:minelibs2/utils/transition.utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = TextEditingController();
  late bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight(context) * .049,
              ),
              FluButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: buttonColor,
                child: FluIcon(
                  FluIcons.arrowLeft,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: screenHeight(context) * .2,
              ),
              Center(
                child: Text(
                  'MineLibs',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Center(
                child: Text(
                  'Please login before continue',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SizedBox(
                height: screenHeight(context) * .04,
              ),
              FluTextField(
                hint: 'Adresse courrielle',
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                textStyle: Theme.of(context).textTheme.headlineMedium,
                height: screenHeight(context) * .08,
                fillColor: inputColorBlack,
                prefix: FluIcon(
                  FluIcons.user,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: screenHeight(context) * .01,
              ),
              FluTextField(
                hint: 'Mot de passe',
                inputController: _passwordController,
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                textStyle: Theme.of(context).textTheme.headlineMedium,
                height: screenHeight(context) * .08,
                fillColor: inputColorBlack,
                expand: false,
                prefix: FluIcon(
                  FluIcons.lock,
                  color: Colors.white,
                ),
                suffix: FluButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  backgroundColor: Colors.transparent,
                  child: FluIcon(
                    FluIcons.eye,
                    color: Colors.white,
                  ),
                ),
                obscureText: false,
              ),
              SizedBox(
                height: screenHeight(context) * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget Passord ?',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    ' Change',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight(context) * .01,
              ),
              FluButton(
                  backgroundColor: promoteColor,
                  onPressed: () {
                    PageTransition.fadeTransition(context, BottomNav());
                  },
                  /*  backgroundColor: buttoncolor,
                         */
                  width: screenWidth(context),
                  height: screenHeight(context) * .08,
                  child: Text(
                    'Connexion',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
