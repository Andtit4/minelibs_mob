
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:minelibs2/presentation/controllers/read_controller.dart';

class ReadBinding extends Bindings{
   @override
  void dependencies() {
    Get.lazyPut(() => ReadController());
  }
}