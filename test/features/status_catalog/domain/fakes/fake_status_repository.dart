import 'package:fpdart/fpdart.dart';
import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';
import 'package:http_cats_app/features/status_catalog/domain/failures/failure.dart';
import 'package:http_cats_app/features/status_catalog/domain/repositories/status_repository.dart';

class FakeStatusRepository implements StatusRepository {
  FakeStatusRepository({
    this.pageResult,
    this.byIdResult,
  });

  Either<Failure, List<StatusEntry>>? pageResult;
  Either<Failure, StatusEntry>? byIdResult;

  @override
  Future<Either<Failure, List<StatusEntry>>> getPage({
    required int offset,
    required int limit,
    StatusCategory? category,
  }) async {
    return pageResult ?? const Right([]);
  }

  @override
  Future<Either<Failure, StatusEntry>> getById(int code) async {
    return byIdResult ?? Left(Failure.notFound(code: code));
  }
}
