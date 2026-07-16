import 'package:http_cats_app/features/status_catalog/data/datasources/asset_status_data_source.dart';
import 'package:http_cats_app/features/status_catalog/data/models/status_entry_model.dart';
import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';

class FakeAssetStatusDataSource extends AssetStatusDataSource {
  @override
  Future<List<StatusEntryModel>> loadBundled() async {
    return [
      const StatusEntryModel(
        code: 200,
        title: 'OK',
        category: StatusCategory.success,
        description: 'Request succeeded',
        imageUrl: 'https://http.cat/200',
      ),
      const StatusEntryModel(
        code: 404,
        title: 'Not Found',
        category: StatusCategory.clientError,
        description: 'Resource not found',
        imageUrl: 'https://http.cat/404',
      ),
    ];
  }
}
