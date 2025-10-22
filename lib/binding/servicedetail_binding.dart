import 'package:customertech/controller/servicedetail_controller.dart';
import 'package:get/get.dart';

class ServiceDetailBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<ServiceDetailController>(() =>ServiceDetailController() );
  }
}