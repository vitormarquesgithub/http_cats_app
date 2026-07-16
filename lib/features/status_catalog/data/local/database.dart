import 'package:drift/drift.dart';
import 'package:http_cats_app/features/status_catalog/data/local/daos/status_dao.dart';
import 'package:http_cats_app/features/status_catalog/data/local/tables/favorites_table.dart';
import 'package:http_cats_app/features/status_catalog/data/local/tables/status_entries_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [StatusEntries, Favorites], daos: [StatusDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
