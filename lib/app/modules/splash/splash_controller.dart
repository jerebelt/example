import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_example/app/data/providers/local_auth.dart';
import 'package:urbe_example/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  @override
  void onReady() {
    _init();
  }

  _init() async {
    await Future.delayed(Duration(seconds: 3));
    final String user = await _localAuth.getSession();
    Get.offNamed(
      user != null ? AppRoutes.HOME : AppRoutes.LOGIN,
    );
  }
}
