
import 'package:customertech/controller/location_controller.dart';
import 'package:get/get.dart';

class SkiplocationBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<LocationController>(() =>LocationController() );
  }
}