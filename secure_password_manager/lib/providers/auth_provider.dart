import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final String error;
  AuthState({this.error = ""});
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  void validPassword(String password, String confirmPassword) {
    if (password.isEmpty || confirmPassword.isEmpty) {
      state = AuthState(error: "Password cannot be empty");
    }

    if (password != confirmPassword) {
      state = AuthState(error: "Password do not match");
    }

    state = AuthState(error: "");
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
