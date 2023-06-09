import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/core/utils/structures/paginable_list.dart';
import 'package:sideboard/modules/mtg_submodule/data/models/card_model.dart';
import 'package:sideboard/modules/mtg_submodule/domain/entities/magic_card.dart';
import 'package:sideboard/modules/mtg_submodule/domain/repository/mtg_repository.dart';

part 'card_search_bloc.freezed.dart';
part 'card_search_event.dart';
part 'card_search_state.dart';

class CardSearchBloc extends Bloc<CardSearchEvent, CardSearchState> {
  CardSearchBloc()
      : super(
          const CardSearchState.initial(
            listType: ListType.grid,
          ),
        ) {
    on<CardSearchEvent>((event, emit) async {
      await event.when(
        started: () {
          emit(const CardSearchState.initial(listType: ListType.grid));
        },
        search: (query) async {
          if (query == null || query.isEmpty) {
            emit(const CardSearchState.initial(listType: ListType.grid));
            return;
          }
          emit(CardSearchState.loading(listType: state.listType));
          await mtgRepository.getMtgCardsBySearch(query).then((result) {
            switch (result) {
              case (null, final PaginableList<MtgCardModel> cards):
                emit(
                  CardSearchState.loaded(
                    listType: state.listType,
                    cards: cards.data.map(MagicCard.fromMtgCardModel).toList(),
                    selectedIndex: null,
                  ),
                );
                break;
              case (final Failure failure, null):
                emit(
                  CardSearchState.error(
                    listType: state.listType,
                    failure: failure,
                  ),
                );
            }
          });
        },
        select: (index) {
          emit(
            state.maybeMap(
              loaded: (loaded) => loaded.copyWith(
                selectedIndex: index,
              ),
              orElse: () => state,
            ),
          );
        },
        listTypeChanged: (listType) {
          emit(state.copyWith(listType: listType));
        },
      );
    });
  }

  final MtgRepository mtgRepository = Modular.get<MtgRepository>();
}
