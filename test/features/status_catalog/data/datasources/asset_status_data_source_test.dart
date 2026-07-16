import 'package:flutter_test/flutter_test.dart';
import 'package:http_cats_app/features/status_catalog/data/datasources/asset_status_data_source.dart';
import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('parses the real bundled dataset without throwing', () async {
    final entries = await AssetStatusDataSource().loadBundled();

    expect(entries, isNotEmpty);
    expect(entries.first.category, isA<StatusCategory>());
  });

  test('maps a known entry correctly', () async {
    final entries = await AssetStatusDataSource().loadBundled();
    final notFound = entries.firstWhere((e) => e.code == 404);

    expect(notFound.title, 'Not Found');
    expect(notFound.category, StatusCategory.clientError);
    expect(notFound.docUrl, contains('404'));
  });
}
