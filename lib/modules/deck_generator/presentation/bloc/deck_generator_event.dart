part of 'deck_generator_bloc.dart';

@freezed
class DeckGeneratorEvent with _$DeckGeneratorEvent {
  const factory DeckGeneratorEvent.started() = _Started;
}