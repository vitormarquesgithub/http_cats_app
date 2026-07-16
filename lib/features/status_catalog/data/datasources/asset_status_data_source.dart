import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http_cats_app/features/status_catalog/data/models/status_entry_model.dart';

class AssetStatusDataSource {
  Future<List<StatusEntryModel>> loadBundled() async {
    final raw = await rootBundle.loadString('assets/status_dataset.json');
    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map((e) => StatusEntryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
