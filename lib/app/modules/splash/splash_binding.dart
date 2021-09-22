import 'package:get/instance_manager.dart';
import 'package:urbe_example/app/modules/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(),
    );
  }
}
