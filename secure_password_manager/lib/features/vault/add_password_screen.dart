import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/models/password_entry.dart';
import 'package:secure_password_manager/providers/vault_provider.dart';

class AddPasswordScreen extends ConsumerWidget {
  const AddPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Add Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "App / Website"),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                final entry = PasswordEntry()
                  ..title = titleController.text
                  ..username = usernameController.text
                  ..encryptedPassword = passwordController.text;

                ref.read(vaultProvider.notifier).addPassword(entry);

                Navigator.pop(context);
              },
              child: const Text("Save Password"),
            ),
          ],
        ),
      ),
    );
  }
}
