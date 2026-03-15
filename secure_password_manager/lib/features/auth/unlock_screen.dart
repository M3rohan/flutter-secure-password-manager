import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/features/vault/vault_screen.dart';
import 'package:secure_password_manager/providers/auth_provider.dart';

class UnlockScreen extends ConsumerWidget {
  const UnlockScreen({super.key});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final authState = ref.watch(authProvider);

    ref.listen(authProvider, (prev, next) {
      if (next.success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const VaultScreen()),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text("Unlock Vault")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(labelText: "Enter Master Password"),
            ),

            SizedBox(height: 20),

            if (authState.error.isNotEmpty)
              Text(authState.error, style: const TextStyle(color: Colors.red)),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).unlockVault(controller.text);
              },
              child: const Text("Unlock"),
            ),
          ],
        ),
      ),
    );
  }
}
