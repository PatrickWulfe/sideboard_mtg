part of 'deck_generator_bloc.dart';

@freezed
class DeckGeneratorState with _$DeckGeneratorState {
  const DeckGeneratorState._();
  const factory DeckGeneratorState.normal({
    required List<OpenAIChatCompletionChoiceMessageModel> aiMessages,
  }) = _Normal;
  const factory DeckGeneratorState.failure({
    required List<OpenAIChatCompletionChoiceMessageModel> aiMessages,
    required Failure error,
  }) = _Failure;

  factory DeckGeneratorState.fromMap(Map<String, Object> json) =>
      DeckGeneratorState.normal(
        aiMessages: (json['aiMessages'] ?? [])
            as List<OpenAIChatCompletionChoiceMessageModel>,
      );

  Map<String, dynamic> toMap() => {
        'aiMessages': aiMessages.map((e) => jsonEncode(e.toMap())).toList(),
      };
}
