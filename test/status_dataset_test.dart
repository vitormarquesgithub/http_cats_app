import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('status_dataset.json is valid', () async {
    final jsonString = await rootBundle.loadString(
      'assets/status_dataset.json',
    );
    final data = jsonDecode(jsonString) as List<dynamic>;

    expect(data, isNotEmpty);

    final codes = <int>{};
    for (final entry in data) {
      final entryMap = entry as Map<dynamic, dynamic>;
      final code = entryMap['code'] as int?;
      final title = entryMap['title'] as String?;
      final category = entryMap['category'] as String?;
      final description = entryMap['shortDescription'] as String?;
      final docLink = entryMap['docLink'] as String?;

      expect(code, isNotNull);
      expect(title, isNotNull);
      expect(category, isNotNull);
      expect(description, isNotNull);
      expect(docLink, isNotNull);

      expect(code, inInclusiveRange(100, 599));
      expect(docLink, startsWith('https://'));

      expect(
        category,
        anyOf(
          equals('1xx Informational'),
          equals('2xx Successful'),
          equals('3xx Redirection'),
          equals('4xx Client Error'),
          equals('5xx Server Error'),
        ),
      );

      expect(codes.contains(code), isFalse, reason: 'Duplicate code: $code');
      codes.add(code!);
    }

    expect(codes, containsAll([200, 404, 500]));
  });
}
