import 'package:get/get.dart';

import '../modules/all_book/bindings/all_book_binding.dart';
import '../modules/all_book/views/all_book_view.dart';
import '../modules/book_read/bindings/book_read_binding.dart';
import '../modules/book_read/views/book_read_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/read/bindings/read_binding.dart';
import '../modules/read/views/read_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ALL_BOOK,
      page: () => const AllBookView(),
      binding: AllBookBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.READ,
      page: () => const ReadView(),
      binding: ReadBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_READ,
      page: () => const BookReadView(),
      binding: BookReadBinding(),
    ),
  ];
}
