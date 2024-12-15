import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/partials/bottom_nav.dart';
import 'package:minelibs2/screens/HomeScreen.dart';
import 'package:minelibs2/screens/auth/LoginScreen.dart';
import 'package:minelibs2/screens/auth/PhoneAuthScreen.dart';
import 'package:minelibs2/utils/app.utils.dart';
import 'package:minelibs2/utils/transition.utils.dart';

class ChoiceLogin extends StatefulWidget {
  final PageController pageController;
  const ChoiceLogin({super.key, required this.pageController});

  @override
  State<ChoiceLogin> createState() => _ChoiceLoginState();
}

class _ChoiceLoginState extends State<ChoiceLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Connexion option',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenHeight(context) * .04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FluButton(
                backgroundColor: Color.fromARGB(50, 244, 67, 54),
                height: screenHeight(context) * .08,
                onPressed: () {},
                child: FluIcon(
                  FluIcons.google,
                  color: Colors.red,
                )),
            FluButton(
                backgroundColor: const Color.fromARGB(88, 158, 158, 158),
                height: screenHeight(context) * .08,
                onPressed: () {},
                child: FluIcon(
                  FluIcons.apple,
                  color: Colors.grey,
                )),
            /*  FluButton(
                backgroundColor: const Color.fromARGB(80, 255, 255, 255),
                height: screenHeight(context) * .08,
                onPressed: () {
                  PageTransition.fadeTransition(context, PhoneAuthScreen());

                },
                child: FluIcon(
                  FluIcons.call,
                  color: Colors.white,
                )), */
            FluButton(
                backgroundColor: const Color.fromARGB(43, 155, 39, 176),
                height: screenHeight(context) * .08,
                onPressed: () {
                  // PageTransition.fadeTransition(context, const LoginPage());
                  Get.bottomSheet(Container(
                    width: screenWidth(context),
                    height: screenHeight(context) * .45,
                    decoration: BoxDecoration(color: Colors.black),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: screenWidth(context) * .13,
                            height: screenHeight(context) * .015,
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /* SizedBox(
                                  height: screenHeight(context) * .049,
                                ), */
                                
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
                                  hintStyle:
                                      Theme.of(context).textTheme.headlineMedium,
                                  textStyle:
                                      Theme.of(context).textTheme.headlineMedium,
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
                                  // inputController: _passwordController,
                                  hintStyle:
                                      Theme.of(context).textTheme.headlineMedium,
                                  textStyle:
                                      Theme.of(context).textTheme.headlineMedium,
                                  height: screenHeight(context) * .08,
                                  fillColor: inputColorBlack,
                                  expand: false,
                                  prefix: FluIcon(
                                    FluIcons.lock,
                                    color: Colors.white,
                                  ),
                                  suffix: FluButton(
                                    onPressed: () {
                                      /* setState(() {
                                        obscureText = !obscureText;
                                      }); */
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
                                      style:
                                          Theme.of(context).textTheme.displaySmall,
                                    ),
                                    Text(
                                      ' Change',
                                      style:
                                          Theme.of(context).textTheme.headlineSmall,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight(context) * .01,
                                ),
                                FluButton(
                                    backgroundColor: promoteColor,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      PageTransition.fadeTransition(
                                          context, BottomNav());
                                    },
                                    /*  backgroundColor: buttoncolor,
                           */
                                    width: screenWidth(context),
                                    height: screenHeight(context) * .08,
                                    child: Text(
                                      'Connexion',
                                      style:
                                          Theme.of(context).textTheme.headlineMedium,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
                },
                child: FluIcon(
                  FluIcons.sms,
                  color: Colors.white,
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Not have an account ?',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            TextButton(
                onPressed: () {
                  widget.pageController.previousPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
                child: Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headlineSmall,
                ))
          ],
        )
      ],
    );
  }
}
