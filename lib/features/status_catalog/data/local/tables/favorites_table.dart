import 'package:drift/drift.dart';

class Favorites extends Table {
  IntColumn get statusCode => integer()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {statusCode};
}
