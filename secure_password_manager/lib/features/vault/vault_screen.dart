import 'package:flutter/material.dart';

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password Vault")),
      body: const Center(child: Text("Vault Screen")),
    );
  }
}
