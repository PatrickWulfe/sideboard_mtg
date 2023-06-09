part of 'card_search_bloc.dart';

@freezed
class CardSearchEvent with _$CardSearchEvent {
  const factory CardSearchEvent.started() = _Started;
  const factory CardSearchEvent.search(String query) = _Search;
  const factory CardSearchEvent.select(int index) = _Select;
  const factory CardSearchEvent.listTypeChanged(ListType listType) =
      _ListTypeChanged;
}
