import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_example/app/modules/global_controller.dart';
import 'package:urbe_example/app/modules/splash/splash_page.dart';
import 'package:urbe_example/app/utils/dependency_injection.dart';

import 'app/modules/splash/splash_binding.dart';
import 'app/routes/app_pages.dart';

void main() {
  final globalController = Get.put(GlobalController());
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
        builder: (_) => GetMaterialApp(
              theme: _.darkMode.value ? ThemeData.dark() : ThemeData.light(),
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
              initialBinding: SplashBinding(),
              getPages: AppPages.pages,
            ));
  }
}
