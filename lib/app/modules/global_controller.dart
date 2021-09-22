import 'package:get/get.dart';

class GlobalController extends GetxController {
  RxBool darkMode = false.obs;

  void changeThemeMode() {
    darkMode.value = !darkMode.value;
    update();
  }
}
