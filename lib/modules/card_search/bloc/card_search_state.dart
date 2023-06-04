part of 'card_search_bloc.dart';

@freezed
class CardSearchState with _$CardSearchState {
  const factory CardSearchState.initial() = CardSearchStateInitial;
  const factory CardSearchState.loading() = CardSearchStateLoading;
  const factory CardSearchState.loaded({
    required List<MagicCard> cards,
    required int? selectedIndex,
  }) = CardSearchStateLoaded;
  const factory CardSearchState.error({
    required Failure failure,
  }) = CardSearchStateError;
}
