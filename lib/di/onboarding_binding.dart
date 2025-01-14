import 'package:get/get.dart';
import 'package:minelibs2/data/repositories/onboarding_repository_impl.dart';
import 'package:minelibs2/domain/repositories/onboarding_repository.dart';
import 'package:minelibs2/presentation/controllers/onboarding_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingBindings extends Bindings {
  final SharedPreferences prefs;

  OnboardingBindings(this.prefs);

  @override
  void dependencies() {
    Get.lazyPut<OnboardingRepository>(
      () => OnboardingRepositoryImpl(prefs),
      fenix: true,
    );
    
    // Ajout du controller
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(Get.find<OnboardingRepository>()),
      fenix: true,
    );
  }
}