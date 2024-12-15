import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:minelibs2/screens/auth/OTPScreen.dart';
import 'package:minelibs2/utils/app.utils.dart';
import 'package:minelibs2/utils/transition.utils.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
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
                  hint: 'Phone number',
                  hintStyle: Theme.of(context).textTheme.headlineMedium,
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  height: screenHeight(context) * .08,
                  keyboardType: TextInputType.phone,
                  fillColor: inputColorBlack,
                  color: Colors.white,

                  prefix: /* InternationalPhoneNumberInput(
                   initialValue: PhoneNumber(isoCode: 'TG'),
                    selectorTextStyle: Theme.of(context).textTheme.headlineMedium,
                    selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          useBottomSheetSafeArea: true,
                          leadingPadding: 20
                        ),
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                  ) */

                  FluButton(
                  onPressed: () {
                    
                  },
                  backgroundColor: Colors.transparent,
                  child: FluIcon(
                    FluIcons.call,
                    color: Colors.white,
                  ),
                ),
                  ),
              SizedBox(
                height: screenHeight(context) * .01,
              ),
              SizedBox(
                height: screenHeight(context) * .01,
              ),
              FluButton(
                  backgroundColor: promoteColor,
                  onPressed: () {
                    PageTransition.fadeTransitionRemplacement(context, OtpScreen());
                  },
                  /*  backgroundColor: buttoncolor,
                         */
                  width: screenWidth(context),
                  height: screenHeight(context) * .08,
                  child: Text(
                    'Get verified SMS',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
