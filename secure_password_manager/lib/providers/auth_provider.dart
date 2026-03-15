import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/providers/secure_storage_provider.dart';

class AuthState {
  final String error;
  final bool success;
  AuthState({this.error = "", this.success = false});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;
  AuthNotifier(this.ref) : super(AuthState());

  Future<void> createMasterPassword(String password) async {
    final storage = ref.read(secureStorageProvider);

    await storage.saveMasterPassword(password);

    state = AuthState(success: true);
  }

  Future<void> unlockVault(String password) async {
    final storage = ref.read(secureStorageProvider);
    final savedPassword = await storage.getMasterPassword();
    if (savedPassword == password) {
      state = AuthState(success: true);
    } else {
      state = AuthState(error: "Incorrect Password");
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});
