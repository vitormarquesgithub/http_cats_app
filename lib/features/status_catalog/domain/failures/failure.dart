import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.notFound({required int code}) = NotFoundFailure;
  const factory Failure.cache([String? message]) = CacheFailure;
  const factory Failure.network([String? message]) = NetworkFailure;
  const factory Failure.unexpected([String? message]) = UnexpectedFailure;
}
