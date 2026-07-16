import 'package:http_cats_app/features/status_catalog/data/datasources/asset_status_data_source.dart';
import 'package:http_cats_app/features/status_catalog/data/local/daos/status_dao.dart';
import 'package:http_cats_app/features/status_catalog/data/local/database.dart';

class LocalStatusDataSource {
  LocalStatusDataSource(this._dao, this._assetSource);

  final StatusDao _dao;
  final AssetStatusDataSource _assetSource;

  Future<void> seedIfEmpty() async {
    final isEmpty = await _dao.isEmpty();
    if (!isEmpty) return;
    final bundled = await _assetSource.loadBundled();
    await _dao.insertAll(bundled);
  }

  Future<List<StatusEntryRow>> getPage({
    required int offset,
    required int limit,
    String? category,
  }) {
    return _dao.getPage(offset: offset, limit: limit, category: category);
  }

  Future<StatusEntryRow?> getById(int code) {
    return _dao.getById(code);
  }
}
