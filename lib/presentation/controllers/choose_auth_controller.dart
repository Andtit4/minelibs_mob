import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseAuthController extends GetxController with GetSingleTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  late Animation<Offset> slideAnimation;
  
  final RxInt currentIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(animationController);

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: const Offset(0, 0)
    ).animate(animationController);

    animationController.forward();
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    animationController.dispose();
    super.onClose();
  }
}