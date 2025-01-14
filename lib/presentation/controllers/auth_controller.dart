import 'package:get/get.dart';

class AuthController extends GetxController {
  var currentPage = 1.obs;
  var obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      currentPage.value++;
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  Future<void> handleGoogleSignIn() async {
    // Implement Google Sign In
    Get.offAllNamed('/bottomNav');
  }

  Future<void> handleAppleSignIn() async {
    // Implement Apple Sign In
    Get.offAllNamed('/bottomNav');
  }

  Future<void> handleEmailSignIn(String email, String password) async {
    // Implement Email Sign In
    Get.offAllNamed('/bottomNav');
  }
}
