part of 'card_parser_bloc.dart';

@freezed
class CardParserState with _$CardParserState {
  const factory CardParserState.initial() = _Initial;
  const factory CardParserState.loading({
    required String inputText,
  }) = _Loading;
  const factory CardParserState.loaded({
    required List<MtgCardEntity> cards,
    required List<String> errors,
  }) = _Loaded;
  const factory CardParserState.error({
    required CardParserFailure failure,
  }) = _Error;
}
