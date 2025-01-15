import 'package:flukit/flukit.dart';
import 'package:get/get.dart';
import 'package:minelibs2/core/services/navigation_service.dart';
import 'package:minelibs2/core/services/theme_service.dart';
import 'package:minelibs2/data/repositories/book_info_repository_impl.dart';
import 'package:minelibs2/data/repositories/onboarding_repository_impl.dart';
import 'package:minelibs2/domain/repositories/book_info_repository.dart';
import 'package:minelibs2/domain/repositories/onboarding_repository.dart';
import 'package:minelibs2/presentation/controllers/auth_controller.dart';
import 'package:minelibs2/presentation/controllers/home_controller.dart';
import 'package:minelibs2/presentation/controllers/navigation_controller.dart';
import 'package:minelibs2/presentation/controllers/onboarding_controller.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    // Services globaux
    final prefs = await SharedPreferences.getInstance();
    // Get.put(prefs); // Mettre l'instance dans GetX

    Get.lazyPut(
      () => prefs,
      fenix: true,
    );
    // Puts
    Get.put(ThemeService());
    Get.put(NavigationService());
    Get.put(AuthController());
    Get.put(NavigationController());
    // Repositories
    Get.lazyPut<OnboardingRepository>(
      () => OnboardingRepositoryImpl(Get.find<SharedPreferences>()),
      fenix: true,
    );
    Get.lazyPut<BookInfoRepository>(
      () => BookInfoRepositoryImpl(Get.find<SharedPreferences>()),
      fenix: true,
    );

    Get.lazyPut(
      () => OnboardingController(Get.find<OnboardingRepository>()),
      fenix: true,
    );

    Get.lazyPut(
      () => HomeController(Get.find<BookInfoRepository>()),
      fenix: true,
    );
    // Get.put(SharedPreferencesImpl());
  }
}
