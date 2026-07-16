// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_dao.dart';

// ignore_for_file: type=lint
mixin _$StatusDaoMixin on DatabaseAccessor<AppDatabase> {
  $StatusEntriesTable get statusEntries => attachedDatabase.statusEntries;
  StatusDaoManager get managers => StatusDaoManager(this);
}

class StatusDaoManager {
  final _$StatusDaoMixin _db;
  StatusDaoManager(this._db);
  $$StatusEntriesTableTableManager get statusEntries =>
      $$StatusEntriesTableTableManager(_db.attachedDatabase, _db.statusEntries);
}
