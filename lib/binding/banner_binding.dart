import 'package:customertech/controller/banner_controller.dart';
import 'package:get/get.dart';

class BannerBinding extends Bindings {
  final bool isDark;
  BannerBinding({required this.isDark});

  @override
  void dependencies() {
     Get.lazyPut<BannerController>(() =>BannerController() );
  }
}
