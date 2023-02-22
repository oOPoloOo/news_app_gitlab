import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

Future<File> get databaseFile async {
  final appDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(appDir.path, 'db.sqlite');
  return File(dbPath);
}

DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    return NativeDatabase.createBackgroundConnection(await databaseFile);
  }));
}
