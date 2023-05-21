part of 'deck_generator_bloc.dart';

@freezed
class DeckGeneratorState with _$DeckGeneratorState {
  const factory DeckGeneratorState.initial({
    required List<OpenAIChatCompletionChoiceMessageModel> messages,
  }) = _Initial;
}
