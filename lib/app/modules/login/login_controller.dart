import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_example/app/data/providers/auth_api.dart';
import 'package:urbe_example/app/data/providers/local_auth.dart';
import 'package:urbe_example/app/routes/app_routes.dart';


class LoginController extends GetxController {
  final AuthAPI _authAPI = Get.find<AuthAPI>();
  final LocalAuth _localAuth = Get.find<LocalAuth>();
  bool loading = false;

  String _username = '', _password = '';

  void onUsernameChanged(String text) {
    _username = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  void startLoading() {
    loading = true;
    update();
  }

  Future<void> submit() async {
    print('submit');
    final authAPI = await _authAPI.authWithLogin(username: _username, password: _password);
    if (authAPI) {
      await _localAuth.setSession(_username);
      Get.offNamed(AppRoutes.HOME);
    } else {
      Get.dialog(AlertDialog(
        title: Text('Error'),
        content: Text('Credenciales inválidas'),
        actions: [
          FlatButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          )
        ],
      ));
    }
  }
}
