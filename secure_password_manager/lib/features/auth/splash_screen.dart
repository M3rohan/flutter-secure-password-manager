import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/features/auth/master_password_screen.dart';
import 'package:secure_password_manager/features/auth/unlock_screen.dart';
import 'package:secure_password_manager/providers/secure_storage_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkVault();
  }

  Future<void> checkVault() async {
    final storage = ref.read(secureStorageProvider);

    final exists = await storage.hasMasterPassword();

    await Future.delayed(Duration(seconds: 1));
    if (!mounted) return;
    if (exists) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const UnlockScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MasterPasswordScreen()),
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(body: Center(child: Icon(Icons.lock, size: 80)));
  }
}
