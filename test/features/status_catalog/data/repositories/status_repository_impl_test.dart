import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_cats_app/features/status_catalog/data/datasources/local_status_data_source.dart';
import 'package:http_cats_app/features/status_catalog/data/local/database.dart';
import 'package:http_cats_app/features/status_catalog/data/repositories/status_repository_impl.dart';
import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';
import 'package:http_cats_app/features/status_catalog/domain/failures/failure.dart';

import '../../fixtures/fake_asset_status_data_source.dart';

void main() {
  late AppDatabase db;
  late StatusRepositoryImpl repository;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    final dataSource = LocalStatusDataSource(
      db.statusDao,
      FakeAssetStatusDataSource(),
    );
    repository = StatusRepositoryImpl(dataSource);
  });

  tearDown(() => db.close());

  group('getPage', () {
    test('returns Right with seeded entries', () async {
      final result = await repository.getPage(offset: 0, limit: 10);

      expect(result.isRight(), true);
      result.match(
        (failure) => fail('expected Right, got Left($failure)'),
        (entries) => expect(entries, hasLength(2)),
      );
    });

    test('filters by category', () async {
      final result = await repository.getPage(
        offset: 0,
        limit: 10,
        category: StatusCategory.clientError,
      );

      result.match(
        (failure) => fail('expected Right, got Left($failure)'),
        (entries) {
          expect(entries, hasLength(1));
          expect(entries.first.code, 404);
        },
      );
    });
  });

  group('getById', () {
    test('returns Right with the matching entry', () async {
      final result = await repository.getById(200);

      result.match(
        (failure) => fail('expected Right, got Left($failure)'),
        (entry) => expect(entry.title, 'OK'),
      );
    });

    test('returns Left NotFoundFailure when code does not exist', () async {
      final result = await repository.getById(999);

      expect(result.isLeft(), true);
      result.match(
        (failure) {
          expect(failure, isA<NotFoundFailure>());
          expect((failure as NotFoundFailure).code, 999);
        },
        (entry) => fail('expected Left, got Right($entry)'),
      );
    });
  });
}
