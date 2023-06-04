import 'package:scryfall_api/scryfall_api.dart' as sfa;
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';
import 'package:sideboard/modules/mtg_submodule/domain/repository/mtg_repository.dart';

class ScryfallRepository implements MtgRepository {
  ScryfallRepository({
    required this.apiClient,
  });
  final sfa.ScryfallApiClient apiClient;

  @override
  Future<(Failure?, MtgCardModel?)> getMtgCardByID(String id) async {
    try {
      final response = await apiClient.getCardById(id);
      return (null, (MtgCardModel.fromSFCard(response)));
    } on sfa.ScryfallException catch (e) {
      return (
        Failure.repositoryException(
          code: e.code,
          details: e.details,
          status: e.status,
          warnings: e.warnings,
        ),
        null
      );
    }
  }

  @override
  Future<(Failure?, PaginableList<MtgCardModel>?)> getMtgCardsBySearch(
    String searchStr,
  ) async {
    try {
      final response = await apiClient.searchCards(
        searchStr,
        rollupMode: sfa.RollupMode.cards,
        sortingOrder: sfa.SortingOrder.name,
        sortingDirection: sfa.SortingDirection.auto,
        includeExtras: false,
        includeMultilingual: false,
        includeVariations: false,
      );
      return (
        null,
        PaginableList(
          data: response.data.map(MtgCardModel.fromSFCard).toList(),
          hasMore: response.hasMore,
          nextPage: response.nextPage,
          totalCards: response.totalCards,
        ),
      );
    } on sfa.ScryfallException catch (e) {
      return (
        Failure.repositoryException(
          code: e.code,
          details: e.details,
          status: e.status,
          warnings: e.warnings,
        ),
        null
      );
    }
  }
}

// typedef GetCardByIdPattern = (Failure?, MtgCardModel?);
// typedef GetCardsBySearchPattern = (Failure?, PaginableList<MtgCardModel>?);
