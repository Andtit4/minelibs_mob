import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/core/theme/colors.dart';
import 'package:minelibs2/presentation/controllers/choose_auth_controller.dart';
import 'components/login_view.dart';
import 'components/signup_view.dart';

class ChooseAuthOptionScreen extends GetView<ChooseAuthController> {
  const ChooseAuthOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.08),
            _buildAuthCard(),
            SizedBox(height: Get.height * 0.03),
            _buildPageView(),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthCard() {
    return Center(
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.53,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(125),
          ),
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.36,
      child: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SignUpView(),
          _buildMainOptionsView(),
          LoginView(),
        ],
      ),
    );
  }

  Widget _buildMainOptionsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: FadeTransition(
            opacity: controller.opacityAnimation,
            child: Text(
              'Support across',
              style: Get.textTheme.bodyLarge,
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        SlideTransition(
          position: controller.slideAnimation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: Get.textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        _buildAuthButton(
          title: 'Login',
          color: Get.theme.primaryColor,
          onPressed: controller.nextPage,
        ),
        SizedBox(height: Get.height * 0.02),
        _buildAuthButton(
          title: 'Sign up',
          color: AppColors.buttonColor,
          onPressed: controller.previousPage,
        ),
      ],
    );
  }

  Widget _buildAuthButton({
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.08,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(
          title,
          style: Get.textTheme.headlineMedium,
        ),
      ),
    );
  }
}