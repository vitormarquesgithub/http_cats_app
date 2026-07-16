import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:http_cats_app/features/status_catalog/data/local/daos/status_dao.dart';
import 'package:http_cats_app/features/status_catalog/data/local/database.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@module
abstract class DatabaseModule {
  @lazySingleton
  AppDatabase provideDatabase() => AppDatabase(_openConnection());

  @lazySingleton
  StatusDao provideStatusDao(AppDatabase db) => db.statusDao;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'http_cats_app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
