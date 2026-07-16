import 'package:fpdart/fpdart.dart';

import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';
import 'package:http_cats_app/features/status_catalog/domain/failures/failure.dart';
import 'package:http_cats_app/features/status_catalog/domain/repositories/status_repository.dart';

class GetStatusById {
  const GetStatusById(this._repository);

  final StatusRepository _repository;

  Future<Either<Failure, StatusEntry>> call(int code) {
    return _repository.getById(code);
  }
}
