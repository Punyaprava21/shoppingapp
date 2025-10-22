import 'package:customertech/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Lazily instantiate HomeController when HomeScreen is opened
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
