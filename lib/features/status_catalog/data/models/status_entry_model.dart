import 'package:drift/drift.dart';
import 'package:http_cats_app/features/status_catalog/data/local/database.dart';
import 'package:http_cats_app/features/status_catalog/domain/entities/status_entry.dart';

class StatusEntryModel {
  const StatusEntryModel({
    required this.code,
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    this.docUrl,
  });

  factory StatusEntryModel.fromJson(Map<String, dynamic> json) {
    final code = json['code'] as int;
    return StatusEntryModel(
      code: code,
      title: json['title'] as String,
      category: _categoryFromLabel(json['category'] as String),
      description: json['shortDescription'] as String,
      imageUrl: 'https://http.cat/$code',
      docUrl: json['docLink'] as String?,
    );
  }

  final int code;
  final String title;
  final StatusCategory category;
  final String description;
  final String imageUrl;
  final String? docUrl;

  StatusEntriesCompanion toCompanion() {
    return StatusEntriesCompanion.insert(
      code: Value(code),
      title: title,
      category: category.name,
      description: description,
      imageUrl: imageUrl,
      docUrl: Value(docUrl),
    );
  }

  static StatusCategory _categoryFromLabel(String label) {
    if (label.startsWith('1xx')) return StatusCategory.informational;
    if (label.startsWith('2xx')) return StatusCategory.success;
    if (label.startsWith('3xx')) return StatusCategory.redirection;
    if (label.startsWith('4xx')) return StatusCategory.clientError;
    if (label.startsWith('5xx')) return StatusCategory.serverError;
    throw FormatException('Unknown status category label: $label');
  }
}

extension StatusEntryRowMapper on StatusEntryRow {
  StatusEntry toEntity() {
    return StatusEntry(
      code: code,
      title: title,
      category: StatusCategory.values.byName(category),
      description: description,
      imageUrl: imageUrl,
      docUrl: docUrl,
    );
  }
}
