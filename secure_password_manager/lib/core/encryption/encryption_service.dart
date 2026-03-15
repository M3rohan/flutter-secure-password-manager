import 'package:encrypt/encrypt.dart';

class EncryptionService {
  final _key = Key.fromUtf8('12345678901234567890123456789012');
  final _iv = IV.fromLength(16);

  late final Encrypter _encrypter;

  EncryptionService() {
    _encrypter = Encrypter(AES(_key));
  }

  String encryptPassword(String password) {
    final encrypted = _encrypter.encrypt(password, iv: _iv);
    return encrypted.base64;
  }

  String decryptPassword(String ecryptedPassword) {
    final decrypted = _encrypter.decrypt64(ecryptedPassword, iv: _iv);
    return decrypted;
  }
}
