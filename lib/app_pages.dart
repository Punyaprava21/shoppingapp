import 'package:customertech/binding/banner_binding.dart';
import 'package:customertech/binding/booking_binding.dart';
import 'package:customertech/binding/home_binding.dart';
import 'package:customertech/binding/login_binding.dart';
import 'package:customertech/binding/main_binding.dart';
import 'package:customertech/binding/profile_binding.dart';
import 'package:customertech/binding/register_binding.dart';
import 'package:customertech/binding/skiplocation_binding.dart';
import 'package:customertech/binding/splash_binding.dart';
import 'package:customertech/controller/banner_controller.dart';
import 'package:customertech/screen/booking_screen.dart';
import 'package:customertech/screen/home_screen.dart';
import 'package:customertech/screen/login_screen.dart';
import 'package:customertech/screen/main_screen.dart';
import 'package:customertech/screen/profile_screen.dart';
import 'package:customertech/screen/register_screen.dart';
import 'package:customertech/screen/skiplocation_screen.dart';
import 'package:customertech/screen/splash_screen.dart';
import 'package:customertech/widget/offerbanner.dart';
import 'package:get/get.dart';

class AppPages {
  // All your routes
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const servicedetail = '/servicedetail';
  static const location = '/location';
  static const main = '/main';
  static const banner = '/banner';
  static const bookings = '/bookings';

  static final pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(name: login, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: home,
      page: () {
        final userName = Get.arguments?['name'] ?? 'User';
        return HomeScreen(userName: userName);
      },
      binding: HomeBinding(),
    ),

    // GetPage(
    //   name: servicedetail,
    //   page: () => ServiceDetailScreen(title: '', price: '',image: '',rating: '',),
    //   binding: ServiceDetailBinding(),
    // ),
    GetPage(
      name: location,
      page: () => const SkipLocationScreen(),
      binding: SkiplocationBinding(),
    ),
    GetPage(name: main, page: () => MainScreen(), binding: MainBinding()),
    GetPage(
      name: '/banner',
      page: () {
        final controller = Get.find<BannerController>();
        return OfferBannerScreen(isDark: true, controller: controller);
      },
      binding: BannerBinding(isDark: true),
    ),
    GetPage(
      name: bookings,
      page: () => const BookingsScreen(),
      binding: BookingsBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
