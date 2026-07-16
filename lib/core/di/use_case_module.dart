import 'package:http_cats_app/features/status_catalog/domain/repositories/status_repository.dart';
import 'package:http_cats_app/features/status_catalog/domain/usecases/get_status_by_id.dart';
import 'package:http_cats_app/features/status_catalog/domain/usecases/get_status_page.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UseCaseModule {
  @lazySingleton
  GetStatusPage provideGetStatusPage(StatusRepository repository) {
    return GetStatusPage(repository);
  }

  @lazySingleton
  GetStatusById provideGetStatusById(StatusRepository repository) {
    return GetStatusById(repository);
  }
}
