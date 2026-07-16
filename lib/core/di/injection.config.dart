// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http_cats_app/core/di/database_module.dart' as _i72;
import 'package:http_cats_app/core/di/use_case_module.dart' as _i539;
import 'package:http_cats_app/features/status_catalog/data/datasources/asset_status_data_source.dart'
    as _i910;
import 'package:http_cats_app/features/status_catalog/data/datasources/local_status_data_source.dart'
    as _i391;
import 'package:http_cats_app/features/status_catalog/data/local/daos/status_dao.dart'
    as _i859;
import 'package:http_cats_app/features/status_catalog/data/local/database.dart'
    as _i265;
import 'package:http_cats_app/features/status_catalog/data/repositories/status_repository_impl.dart'
    as _i304;
import 'package:http_cats_app/features/status_catalog/domain/repositories/status_repository.dart'
    as _i210;
import 'package:http_cats_app/features/status_catalog/domain/usecases/get_status_by_id.dart'
    as _i843;
import 'package:http_cats_app/features/status_catalog/domain/usecases/get_status_page.dart'
    as _i475;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    final useCaseModule = _$UseCaseModule();
    gh.factory<_i910.AssetStatusDataSource>(
      () => _i910.AssetStatusDataSource(),
    );
    gh.lazySingleton<_i265.AppDatabase>(() => databaseModule.provideDatabase());
    gh.lazySingleton<_i859.StatusDao>(
      () => databaseModule.provideStatusDao(gh<_i265.AppDatabase>()),
    );
    gh.lazySingleton<_i391.LocalStatusDataSource>(
      () => _i391.LocalStatusDataSource(
        gh<_i859.StatusDao>(),
        gh<_i910.AssetStatusDataSource>(),
      ),
    );
    gh.lazySingleton<_i210.StatusRepository>(
      () => _i304.StatusRepositoryImpl(gh<_i391.LocalStatusDataSource>()),
    );
    gh.lazySingleton<_i475.GetStatusPage>(
      () => useCaseModule.provideGetStatusPage(gh<_i210.StatusRepository>()),
    );
    gh.lazySingleton<_i843.GetStatusById>(
      () => useCaseModule.provideGetStatusById(gh<_i210.StatusRepository>()),
    );
    return this;
  }
}

class _$DatabaseModule extends _i72.DatabaseModule {}

class _$UseCaseModule extends _i539.UseCaseModule {}
