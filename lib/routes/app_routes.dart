import 'package:get/get.dart';
import 'package:minelibs2/di/home_binding.dart';
import 'package:minelibs2/di/navigation_binding.dart';
import 'package:minelibs2/old/screens/HomeScreen.dart';
import 'package:minelibs2/presentation/screens/navigation/navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/screens/auth/choose_auth_option_screen.dart';
import '../presentation/screens/onboarding/get_started_screen.dart';
import '../di/auth_binding.dart';
import '../di/onboarding_binding.dart';

class AppPages {
  static const INITIAL = Routes.ONBOARDING;

  static Future<List<GetPage>> getPages() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return [
      GetPage(
        name: Routes.CHOOSE_AUTH,
        page: () => const ChooseAuthOptionScreen(),
        binding: AuthBinding(),
        transition: Transition.fade,
      ),
      GetPage(
        name: Routes.ONBOARDING,
        page: () => const GetStartedScreen(),
        binding: OnboardingBindings(prefs),
        transition: Transition.fade,
      ),
      GetPage(
        name: Routes.BOTTOMNAV,
        page: () => const NavigationScreen(),
        binding: NavigationBinding(),
        transition: Transition.fade,
      ),
      GetPage(
        name: Routes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding(prefs),
        transition: Transition.fade,
      ),
    ];
  }
}

class Routes {
  static const CHOOSE_AUTH = '/auth/choose-option';
  static const ONBOARDING = '/onboarding';
  static const BOTTOMNAV = '/bottomNav';
  static const HOME = '/home';

}
