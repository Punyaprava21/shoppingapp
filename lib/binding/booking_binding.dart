import 'package:get/get.dart';
import 'package:customertech/controller/booking_controller.dart';

class BookingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingsController>(() => BookingsController());
  }
}
