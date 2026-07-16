import 'package:fpdart/fpdart.dart';

import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';
import 'package:http_cats_app/features/status_catalog/domain/failures/failure.dart';
import 'package:http_cats_app/features/status_catalog/domain/repositories/status_repository.dart';

class GetStatusPageParams {
  const GetStatusPageParams({
    required this.offset,
    required this.limit,
    this.category,
  });

  final int offset;
  final int limit;
  final StatusCategory? category;
}

class GetStatusPage {
  const GetStatusPage(this._repository);

  final StatusRepository _repository;

  Future<Either<Failure, List<StatusEntry>>> call(
    GetStatusPageParams params,
  ) {
    return _repository.getPage(
      offset: params.offset,
      limit: params.limit,
      category: params.category,
    );
  }
}
