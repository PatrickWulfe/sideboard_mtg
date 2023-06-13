part of 'card_search_bloc.dart';

@freezed
class CardSearchState with _$CardSearchState {
  const factory CardSearchState.initial({
    required ListType listType,
  }) = CardSearchStateInitial;
  const factory CardSearchState.loading({
    required ListType listType,
  }) = CardSearchStateLoading;
  const factory CardSearchState.loaded({
    required ListType listType,
    required List<MtgCardEntity> cards,
    required int? selectedIndex,
  }) = CardSearchStateLoaded;
  const factory CardSearchState.error({
    required ListType listType,
    required Failure failure,
  }) = CardSearchStateError;
}

enum ListType {
  list,
  grid,
}

extension ListTypeName on ListType {
  String get name {
    switch (this) {
      case ListType.list:
        return 'list';
      case ListType.grid:
        return 'grid';
    }
  }
}
