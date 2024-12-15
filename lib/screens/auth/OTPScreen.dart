import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:minelibs2/partials/bottom_nav.dart';
import 'package:minelibs2/screens/HomeScreen.dart';
import 'package:minelibs2/utils/app.utils.dart';
import 'package:minelibs2/utils/transition.utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                  'Vérification',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Center(
                child: Text(
                  'Enter the 4-Digits keys sent to you on your phone number\nYour phone number',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SizedBox(
                height: screenHeight(context) * .04,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PinCodeTextField(
                  appContext: context,
                  animationCurve: Curves.easeInOut,
                  keyboardType: TextInputType.number,
                  length: 4,
                  pinTheme: PinTheme.defaults(
                      borderRadius: BorderRadius.circular(15),
                      fieldWidth: 70,
                      fieldHeight: 70,
                      inactiveBorderWidth: 0,
                      inactiveColor: Colors.white,
                      inactiveFillColor: buttonColor,
                      activeColor: Colors.white,
                      activeFillColor: Colors.white,
                      selectedColor: promoteColor,
                      selectedBorderWidth: 1,
                      activeBorderWidth: 0,
                      borderWidth: 0,
                      shape: PinCodeFieldShape.box),
                ),
              ),
              /* FluTextField(
                hint: 'Adresse courrielle',
                hintStyle: Theme.of(context).textTheme.headline4,
                textStyle: Theme.of(context).textTheme.headline4,
                height: screenHeight(context) * .08,
                fillColor: inputColorBlack,
                prefix: FluIcon(
                  FluIcons.user,
                  color: Colors.white,
                ),
              ), */
              SizedBox(
                height: screenHeight(context) * .01,
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
