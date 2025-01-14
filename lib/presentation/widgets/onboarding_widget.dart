import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/domain/entities/onboarding_step.dart';

class OnboardingStepWidget extends StatelessWidget {
  final OnboardingStep step;

  const OnboardingStepWidget({Key? key, required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: Get.height * .1),
        Text(
          step.title,
          style: Get.textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              step.subtitle.split(' ').first,
              style: Get.textTheme.displayLarge,
            ),
            Text(
              ' ${step.subtitle.split(' ').skip(1).join(' ')}',
              style: Get.textTheme.displayMedium,
            ),
          ],
        ),
        SizedBox(height: Get.height * .02),
        AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 1),
          child: Text(
            step.description,
            style: Get.textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}