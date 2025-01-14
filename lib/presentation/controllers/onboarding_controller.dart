import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/domain/entities/onboarding_step.dart';
import 'package:minelibs2/domain/repositories/onboarding_repository.dart';

class OnboardingController extends GetxController {
  final OnboardingRepository _repository;
  final pageController = PageController();
  final currentIndex = 0.obs;
  final steps = <OnboardingStep>[].obs;

  OnboardingController(this._repository);

  @override
  void onInit() {
    super.onInit();
    steps.value = _repository.getOnboardingSteps();
  }

  void nextPage() {
    if (currentIndex.value < steps.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
      currentIndex.value++;
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
      currentIndex.value--;
    }
  }

  Future<void> completeOnboarding() async {
    await _repository.setOnboardingComplete();
    Get.offAllNamed('/auth/choose-option');
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}