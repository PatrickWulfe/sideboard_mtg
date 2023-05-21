part of 'deck_generator_bloc.dart';

@freezed
class DeckGeneratorState with _$DeckGeneratorState {
  const DeckGeneratorState._();
  const factory DeckGeneratorState.initial({
    required List<OpenAIChatCompletionChoiceMessageModel> messages,
  }) = _Initial;

  factory DeckGeneratorState.fromMap(Map<String, Object> json) =>
      DeckGeneratorState.initial(
        messages: (json['messages'] ?? [])
            as List<OpenAIChatCompletionChoiceMessageModel>,
      );

  Map<String, dynamic> toMap() => {
        'messages': messages.map((e) => jsonEncode(e.toMap())).toList(),
      };
}
