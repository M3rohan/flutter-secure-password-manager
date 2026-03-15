import 'package:isar/isar.dart';

part 'password_entry.g.dart';

@collection
class PasswordEntry {
  Id id = Isar.autoIncrement;
  late String title;
  late String username;
  late String encryptedPassword;
  String? category;
  String? notes;
  DateTime createdAt = DateTime.now();
}
