import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secure_password_manager/models/password_entry.dart';

class IsarService {
  static Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [PasswordEntrySchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
