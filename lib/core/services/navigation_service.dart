import 'package:get/get.dart';

class NavigationService extends GetxService {
  Future<void> navigateToAuth() async {
    await Get.offAllNamed('/auth/choose-option');
  }

  Future<void> navigateToHome() async {
    await Get.offAllNamed('/home');
  }

  Future<void> navigateToLogin() async {
    await Get.toNamed('/login');
  }

  Future<void> navigateToSignup() async {
    await Get.toNamed('/signup');
  }

  Future<void> navigateToBottomNav() async {
    await Get.toNamed('/bottomNav');
  }
}