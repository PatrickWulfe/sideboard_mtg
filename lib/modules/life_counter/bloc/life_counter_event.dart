part of 'life_counter_bloc.dart';

@freezed
class LifeCounterEvent with _$LifeCounterEvent {
  const factory LifeCounterEvent.started() = _Started;
}