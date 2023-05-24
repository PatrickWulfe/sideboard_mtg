part of 'deck_generator_bloc.dart';

@freezed
class DeckGeneratorState with _$DeckGeneratorState {
  const DeckGeneratorState._();
  const factory DeckGeneratorState.initial({
    required List<OpenAIChatCompletionChoiceMessageModel> aiMessages,
  }) = _Initial;

  factory DeckGeneratorState.fromMap(Map<String, Object> json) =>
      DeckGeneratorState.initial(
        aiMessages: (json['aiMessages'] ?? [])
            as List<OpenAIChatCompletionChoiceMessageModel>,
      );

  Map<String, dynamic> toMap() => {
        'aiMessages': aiMessages.map((e) => jsonEncode(e.toMap())).toList(),
      };
}
