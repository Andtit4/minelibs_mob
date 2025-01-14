import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/core/theme/colors.dart';
import 'package:minelibs2/presentation/controllers/auth_controller.dart';

class SignUpView extends GetView<AuthController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign Up Options',
            style: Get.textTheme.bodyLarge,
          ),
          Center(
            child: Text(
              'Please login before continue',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: Get.height * .04,
          ),
          FluTextField(
            hint: 'Adresse courrielle',
            hintStyle: Theme.of(context).textTheme.headlineMedium,
            textStyle: Theme.of(context).textTheme.headlineMedium,
            height: Get.height * .08,
            fillColor: AppColors.inputColorBlack,
            prefix: FluIcon(
              FluIcons.user,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          FluTextField(
            hint: 'Mot de passe',
            // inputController: _passwordController,
            hintStyle: Theme.of(context).textTheme.headlineMedium,
            textStyle: Theme.of(context).textTheme.headlineMedium,
            height: Get.height * .08,
            fillColor: AppColors.inputColorBlack,
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
            height: Get.height * .01,
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
            height: Get.height * .01,
          ),
          FluButton(
              backgroundColor: AppColors.promoteColor,
              onPressed: () {
                /*  Navigator.pop(context);
                                        PageTransition.fadeTransition(
                                            context, BottomNav()); */
              },
              /*  backgroundColor: buttoncolor,
                             */
              width: Get.width,
              height: Get.height * .08,
              child: Text(
                'Connexion',
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          // Rest of the signup view implementation
        ],
      ),
    );
  }
}
