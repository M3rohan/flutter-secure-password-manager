import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/features/auth/unlock_screen.dart';
import 'package:secure_password_manager/providers/auth_provider.dart';

class MasterPasswordScreen extends ConsumerWidget {
  MasterPasswordScreen({super.key});

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UnlockScreen()),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(title: Text("Create Master Password")),
      body: Column(
        children: [
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Master Password"),
          ),
          SizedBox(height: 20),
          TextField(
            controller: confirmController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Cofirm Password"),
          ),
          SizedBox(height: 20),
          if (authState.error.isNotEmpty)
            Text(authState.error, style: const TextStyle(color: Colors.red)),

          SizedBox(height: 30),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ref
                    .read(authProvider.notifier)
                    .createMasterPassword(passwordController.text);
              },
              child: Text("Create Vault"),
            ),
          ),
        ],
      ),
    );
  }
}
