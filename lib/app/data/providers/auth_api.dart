import 'package:flutter/material.dart';

class AuthAPI {
  Future<bool> authWithLogin({@required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    return password == '123456';
  }
}
