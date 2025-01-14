import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:minelibs2/domain/entities/onboarding_step.dart';
import 'package:minelibs2/old/utils/app.utils.dart';
import 'package:minelibs2/presentation/controllers/onboarding_controller.dart';
import 'package:minelibs2/presentation/widgets/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// lib/presentation/screens/onboarding/get_started_screen.dart
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controllers/onboarding_controller.dart';

class GetStartedScreen extends GetView<OnboardingController> {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .45,
                  ),
                  SizedBox(
                    height: Get.height * .4,
                    width: Get.width,
                    child: PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) => controller.currentIndex.value = value,
                      children: controller.steps.map((step) => 
                        OnboardingStepContent(step: step)
                      ).toList(),
                    ),
                  ),
                  Center(
                    child: Obx(() => SmoothPageIndicator(
                      controller: controller.pageController,
                      count: controller.steps.length,
                      axisDirection: Axis.horizontal,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 6,
                        dotHeight: 6,
                        dotColor: Color.fromARGB(52, 255, 255, 255),
                        activeDotColor: Colors.white,
                      ),
                    )),
                  ),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (controller.currentIndex.value > 0)
                        FluButton(
                          backgroundColor: Colors.transparent,
                          onPressed: controller.previousPage,
                          child: FluIcon(
                            FluIcons.arrowLeft,
                            style: FluIconStyles.broken,
                            color: Colors.white,
                          ),
                        )
                      else
                        const SizedBox(),
                      
                      if (controller.currentIndex.value == controller.steps.length - 1)
                        FluButton(
                          backgroundColor: promoteColor,
                          width: Get.width * .3,
                          onPressed: () async {
                            await controller.completeOnboarding();
                          },
                          child: 
                            Text(
                                'Get Started',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                        )
                      else
                        FluButton(
                          backgroundColor: buttonColor,
                          onPressed: controller.nextPage,
                          child: FluIcon(
                            FluIcons.arrowRight,
                            style: FluIconStyles.broken,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingStepContent extends StatelessWidget {
  final OnboardingStep step;

  const OnboardingStepContent({
    Key? key,
    required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * .1,
        ),
        Text(
          step.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              step.subtitle.split(' ')[0], // 'Ipsum dolor'
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              ' ${step.subtitle.split(' ').sublist(1).join(' ')}', // 'emet si vis'
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
        ),
        SizedBox(height: Get.height * .02),
        AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(seconds: 1),
          child: Text(
            step.description,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}