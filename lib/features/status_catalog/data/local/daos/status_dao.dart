import 'package:drift/drift.dart';
import 'package:http_cats_app/features/status_catalog/data/local/database.dart';
import 'package:http_cats_app/features/status_catalog/data/local/tables/status_entries_table.dart';
import 'package:http_cats_app/features/status_catalog/data/models/status_entry_model.dart';

part 'status_dao.g.dart';

@DriftAccessor(tables: [StatusEntries])
class StatusDao extends DatabaseAccessor<AppDatabase> with _$StatusDaoMixin {
  StatusDao(super.attachedDatabase);

  Future<bool> isEmpty() async {
    final rows = await select(statusEntries).get();
    return rows.isEmpty;
  }

  Future<void> insertAll(List<StatusEntryModel> models) {
    return batch((batch) {
      batch.insertAll(
        statusEntries,
        models.map((m) => m.toCompanion()),
      );
    });
  }

  Future<List<StatusEntryRow>> getPage({
    required int offset,
    required int limit,
    String? category,
  }) {
    final query = select(statusEntries)..limit(limit, offset: offset);
    if (category != null) {
      query.where((t) => t.category.equals(category));
    }
    return query.get();
  }

  Future<StatusEntryRow?> getById(int code) {
    return (select(
      statusEntries,
    )..where((t) => t.code.equals(code))).getSingleOrNull();
  }
}
