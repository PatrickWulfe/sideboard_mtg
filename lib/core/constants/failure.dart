import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';
part 'failure.g.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  const factory Failure.openAIRequestFailure({
    required String message,
    int? statusCode,
  }) = OpenAIRequestFailure;

  const factory Failure.repositoryException({
    required String code,
    required String details,
    required int status,
    required List<String>? warnings,
  }) = RepositoryExceptionFailure;

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);
}
