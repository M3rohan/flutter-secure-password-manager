import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/core/utils/secure_storage_service.dart';

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});
