import 'package:fpdart/fpdart.dart';
import 'package:http_cats_app/features/status_catalog/data/datasources/local_status_data_source.dart';
import 'package:http_cats_app/features/status_catalog/data/models/status_entry_model.dart';
import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';
import 'package:http_cats_app/features/status_catalog/domain/failures/failure.dart';
import 'package:http_cats_app/features/status_catalog/domain/repositories/status_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StatusRepository)
class StatusRepositoryImpl implements StatusRepository {
  StatusRepositoryImpl(this._local);

  final LocalStatusDataSource _local;

  @override
  Future<Either<Failure, List<StatusEntry>>> getPage({
    required int offset,
    required int limit,
    StatusCategory? category,
  }) async {
    try {
      await _local.seedIfEmpty();
      final rows = await _local.getPage(
        offset: offset,
        limit: limit,
        category: category?.name,
      );
      return right(rows.map((r) => r.toEntity()).toList());
    } on Object catch (e) {
      return left(Failure.cache(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StatusEntry>> getById(int code) async {
    try {
      await _local.seedIfEmpty();
      final row = await _local.getById(code);
      if (row == null) {
        return left(Failure.notFound(code: code));
      }
      return right(row.toEntity());
    } on Object catch (e) {
      return left(Failure.cache(e.toString()));
    }
  }
}
