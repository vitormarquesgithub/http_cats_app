import 'package:drift/drift.dart';

@DataClassName('StatusEntryRow')
class StatusEntries extends Table {
  IntColumn get code => integer()();
  TextColumn get title => text()();
  TextColumn get category => text()();
  TextColumn get description => text()();
  TextColumn get imageUrl => text()();
  TextColumn get docUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {code};
}
