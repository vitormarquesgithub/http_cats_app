import 'package:fpdart/fpdart.dart';

import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';
import 'package:http_cats_app/features/status_catalog/domain/failures/failure.dart';

abstract interface class StatusRepository {
  Future<Either<Failure, List<StatusEntry>>> getPage({
    required int offset,
    required int limit,
    StatusCategory? category,
  });

  Future<Either<Failure, StatusEntry>> getById(int code);
}
