import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';
import 'package:http_cats_app/features/status_catalog/domain/failures/failure.dart';
import 'package:http_cats_app/features/status_catalog/domain/usecases/get_status_by_id.dart';
import '../fakes/fake_status_repository.dart';

void main() {
  group('GetStatusById', () {
    test('returns a StatusEntry when the repository finds it', () async {
      const entry = StatusEntry(
        code: 404,
        title: 'Not Found',
        category: StatusCategory.clientError,
        description: 'desc',
        imageUrl: 'https://http.cat/404',
      );
      final repository = FakeStatusRepository(
        byIdResult: const Right<Failure, StatusEntry>(entry),
      );
      final useCase = GetStatusById(repository);

      final result = await useCase(404);

      expect(result, const Right<Failure, StatusEntry>(entry));
    });

    test('returns a Failure when the repository does not find it', () async {
      const failure = Failure.notFound(code: 999);
      final repository = FakeStatusRepository(
        byIdResult: const Left<Failure, StatusEntry>(failure),
      );
      final useCase = GetStatusById(repository);

      final result = await useCase(999);

      expect(result, const Left<Failure, StatusEntry>(failure));
    });
  });
}
