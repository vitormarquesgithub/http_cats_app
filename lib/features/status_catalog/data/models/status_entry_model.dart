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
    return StatusEntryModel(
      code: json['code'] as int,
      title: json['title'] as String,
      category: StatusCategory.values.byName(json['category'] as String),
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      docUrl: json['doc_url'] as String?,
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
