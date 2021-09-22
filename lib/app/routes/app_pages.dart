import 'package:get/get.dart';
import 'package:urbe_example/app/modules/details/details_binding.dart';
import 'package:urbe_example/app/modules/details/details_page.dart';
import 'package:urbe_example/app/modules/home/home_binding.dart';
import 'package:urbe_example/app/modules/home/home_page.dart';
import 'package:urbe_example/app/modules/login/login_binding.dart';
import 'package:urbe_example/app/modules/login/login_page.dart';
import 'package:urbe_example/app/modules/splash/splash_binding.dart';
import 'package:urbe_example/app/modules/splash/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAILS,
      page: () => DetailsPage(img: Get.arguments),
      binding: DetailsBinding(),
    ),
  ];
}
