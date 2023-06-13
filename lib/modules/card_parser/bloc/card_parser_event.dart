part of 'card_parser_bloc.dart';

@freezed
class CardParserEvent with _$CardParserEvent {
  const factory CardParserEvent.started() = _Started;
  const factory CardParserEvent.textSubmitted(String inputText) =
      _TextSubmitted;
}
