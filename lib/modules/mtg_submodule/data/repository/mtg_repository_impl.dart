import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mocktail/mocktail.dart';
import 'package:scryfall_api/scryfall_api.dart' as sfa;
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';
import 'package:sideboard/modules/mtg_submodule/domain/repository/mtg_repository.dart';

class MtgRepositoryImpl implements MtgRepository {
  final sfa.ScryfallApiClient apiClient = Modular.get<sfa.ScryfallApiClient>();

  @override
  Future<Either<Failure, MtgCardModel?>> getMtgCardByID(String id) async {
    try {
      final response = await apiClient.getCardById(id);
      return Right(MtgCardModel.fromSFCard(response));
    } on sfa.ScryfallException catch (e) {
      return Left(
        Failure.repositoryException(
          code: e.code,
          details: e.details,
          status: e.status,
          warnings: e.warnings,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PaginableList<MtgCardModel>>> getMtgCardsBySearch(
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
      return Right(
        PaginableList(
          data: response.data.map(MtgCardModel.fromSFCard).toList(),
          hasMore: response.hasMore,
          nextPage: response.nextPage,
          totalCards: response.totalCards,
        ),
      );
    } on sfa.ScryfallException catch (e) {
      return Left(
        Failure.repositoryException(
          code: e.code,
          details: e.details,
          status: e.status,
          warnings: e.warnings,
        ),
      );
    }
  }
}

class MockMtgRepositoryImpl extends Mock implements MtgRepositoryImpl {}
