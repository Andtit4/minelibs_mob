import 'package:get/get.dart';
import 'package:minelibs2/data/repositories/book_info_repository_impl.dart';
import 'package:minelibs2/data/repositories/onboarding_repository_impl.dart';
import 'package:minelibs2/domain/repositories/book_info_repository.dart';
import 'package:minelibs2/domain/repositories/onboarding_repository.dart';
import 'package:minelibs2/presentation/controllers/home_controller.dart';
import 'package:minelibs2/presentation/controllers/onboarding_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBinding extends Bindings {
  final SharedPreferences prefs;

  HomeBinding(this.prefs);

  @override
  void dependencies() {
    Get.lazyPut<BookInfoRepository>(
      () => BookInfoRepositoryImpl(prefs),
      fenix: true,
    );
    
    // Ajout du controller
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<BookInfoRepository>()),
      fenix: true,
    );
  }
}