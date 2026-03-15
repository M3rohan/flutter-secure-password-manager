import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/core/encryption/encryption_service.dart';

final encryptionProvider = Provider<EncryptionService>((ref) {
  return EncryptionService();
});
