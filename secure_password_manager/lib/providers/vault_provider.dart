import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/models/password_entry.dart';
import 'package:secure_password_manager/providers/datebase_provider.dart';
import 'package:secure_password_manager/providers/encryption_provider.dart';

final vaultProvider = StateNotifierProvider<VaultNotifier, List<PasswordEntry>>(
  (ref) => VaultNotifier(ref),
);

class VaultNotifier extends StateNotifier<List<PasswordEntry>> {
  final Ref ref;
  VaultNotifier(this.ref) : super([]);

  Future<void> loadPasswords() async {
    final db = ref.read(databaseProvider);
    final data = await db.getPasswords();
    state = data;
  }

  Future<void> addPassword(PasswordEntry entry) async {
    final db = ref.read(databaseProvider);
    final encryption = ref.read(encryptionProvider);
    entry.encryptedPassword = encryption.encryptPassword(
      entry.encryptedPassword,
    );

    await db.savePassword(entry);
    await loadPasswords();
  }
}
