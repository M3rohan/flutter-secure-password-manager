import 'dart:core';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const masterPasswordKey = "master_password";

  Future<void> setMasterPassword(String password) async {
    await _storage.write(key: masterPasswordKey, value: password);
  }

  Future<String?> getMasterPassword() async {
    return await _storage.read(key: masterPasswordKey);
  }

  Future<bool> hasMasterPassword() async {
    final password = await _storage.read(key: masterPasswordKey);
    return password != null;
  }
}
