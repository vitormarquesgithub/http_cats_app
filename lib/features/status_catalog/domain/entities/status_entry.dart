import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_entry.freezed.dart';

enum StatusCategory {
  informational,
  success,
  redirection,
  clientError,
  serverError,
}

@freezed
abstract class StatusEntry with _$StatusEntry {
  const factory StatusEntry({
    required int code,
    required String title,
    required StatusCategory category,
    required String description,
    required String imageUrl,
    String? docUrl,
  }) = _StatusEntry;
}
