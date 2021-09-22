import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:urbe_example/app/data/providers/auth_api.dart';
import 'package:urbe_example/app/data/providers/imgs_api.dart';
import 'package:urbe_example/app/data/providers/local_auth.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(), fenix: true);
    Get.lazyPut<AuthAPI>(() => AuthAPI(), fenix: true);
    Get.lazyPut<LocalAuth>(() => LocalAuth(), fenix: true);
    Get.lazyPut<ImgsAPI>(() => ImgsAPI(), fenix: true);
    Get.put<Dio>(Dio());
  }
}
