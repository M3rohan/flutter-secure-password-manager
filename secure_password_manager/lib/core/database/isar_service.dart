import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secure_password_manager/models/password_entry.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open([PasswordEntrySchema], directory: dir.path);
  }

  Future<void> savePassword(PasswordEntry entry) async {
    final isar = await db;

    await isar.writeTxn(() async {
      await isar.passwordEntrys.put(entry);
    });
  }

  Future<List<PasswordEntry>> getPasswords() async {
    final isar = await db;
    return await isar.passwordEntrys.where().findAll();
  }
}
