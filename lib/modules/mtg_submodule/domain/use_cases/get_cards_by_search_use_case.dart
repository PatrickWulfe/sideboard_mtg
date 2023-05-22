import 'package:dartz/dartz.dart';
import 'package:sideboard/core/core_index.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';
import 'package:sideboard/modules/mtg_submodule/domain/domain_index.dart';

class GetCardsBySearchUseCase {
  GetCardsBySearchUseCase(this.repository);
  final MtgRepository repository;

  Future<Either<Failure, PaginableList<MtgCardModel>>> execute(
    String searchStr,
  ) async {
    return repository.getMtgCardsBySearch(searchStr);
  }
}
