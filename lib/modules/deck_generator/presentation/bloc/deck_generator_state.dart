part of 'deck_generator_bloc.dart';

@freezed
class DeckGeneratorState with _$DeckGeneratorState {
  const factory DeckGeneratorState.initial({
    required String response,
  }) = _Initial;
}
