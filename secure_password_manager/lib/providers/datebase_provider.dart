import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secure_password_manager/core/database/isar_service.dart';

final databaseProvider = Provider((ref) {
  return IsarService();
});
