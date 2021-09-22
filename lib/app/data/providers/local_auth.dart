import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalAuth {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(String username) async {
    await _storage.write(key: 'user', value: username);
  }

  Future<void> deleteSession() async {
    await _storage.delete(key: 'user');
  }

  Future<String> getSession() async {
    final data = await _storage.read(key: 'user');
    return data;
  }
}
