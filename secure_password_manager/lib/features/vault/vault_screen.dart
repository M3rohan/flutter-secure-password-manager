import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/features/vault/add_password_screen.dart';
import 'package:secure_password_manager/providers/vault_provider.dart';

class VaultScreen extends ConsumerStatefulWidget {
  const VaultScreen({super.key});

  @override
  ConsumerState<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends ConsumerState<VaultScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(vaultProvider.notifier).loadPasswords();
    });
  }

  @override
  Widget build(BuildContext context) {
    final passwords = ref.watch(vaultProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Password Vault")),
      body: ListView.builder(
        itemCount: passwords.length,
        itemBuilder: (context, index) {
          final item = passwords[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.username),
            trailing: IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: item.encryptedPassword));
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Password copied")));
              },
              icon: Icon(Icons.copy),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => AddPasswordScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
