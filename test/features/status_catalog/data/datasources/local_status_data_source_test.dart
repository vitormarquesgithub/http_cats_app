import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_cats_app/features/status_catalog/data/datasources/local_status_data_source.dart';
import 'package:http_cats_app/features/status_catalog/data/local/database.dart';

import '../../fixtures/fake_asset_status_data_source.dart';

void main() {
  late AppDatabase db;
  late LocalStatusDataSource dataSource;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    dataSource = LocalStatusDataSource(
      db.statusDao,
      FakeAssetStatusDataSource(),
    );
  });

  tearDown(() => db.close());

  group('seedIfEmpty', () {
    test('seeds from asset source when db is empty', () async {
      final before = await dataSource.getPage(offset: 0, limit: 10);
      expect(before, isEmpty);

      await dataSource.seedIfEmpty();

      final after = await dataSource.getPage(offset: 0, limit: 10);
      expect(after, hasLength(2));
    });

    test('does not re-seed when db already has data', () async {
      await dataSource.seedIfEmpty();
      final firstSeed = await dataSource.getPage(offset: 0, limit: 10);

      await dataSource.seedIfEmpty();
      final secondCall = await dataSource.getPage(offset: 0, limit: 10);

      expect(secondCall.length, firstSeed.length);
    });
  });

  group('getPage', () {
    test('respects offset and limit', () async {
      await dataSource.seedIfEmpty();

      final page = await dataSource.getPage(offset: 0, limit: 1);

      expect(page, hasLength(1));
    });

    test('filters by category', () async {
      await dataSource.seedIfEmpty();

      final page = await dataSource.getPage(
        offset: 0,
        limit: 10,
        category: 'clientError',
      );

      expect(page, hasLength(1));
      expect(page.first.code, 404);
    });
  });

  group('getById', () {
    test('returns the matching row', () async {
      await dataSource.seedIfEmpty();

      final row = await dataSource.getById(200);

      expect(row, isNotNull);
      expect(row!.title, 'OK');
    });

    test('returns null when code does not exist', () async {
      await dataSource.seedIfEmpty();

      final row = await dataSource.getById(999);

      expect(row, isNull);
    });
  });
}
