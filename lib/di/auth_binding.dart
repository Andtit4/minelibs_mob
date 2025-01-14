import 'package:get/get.dart';
import 'package:minelibs2/presentation/controllers/auth_controller.dart';
import 'package:minelibs2/presentation/controllers/choose_auth_controller.dart';


class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ChooseAuthController());
  }
}
