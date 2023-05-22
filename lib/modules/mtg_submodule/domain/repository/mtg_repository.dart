import 'package:dartz/dartz.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

abstract class MtgRepository {
  Future<Either<Failure, MtgCardModel?>> getMtgCardByID(String id);
  Future<Either<Failure, PaginableList<MtgCardModel>>> getMtgCardsBySearch(
    String searchStr,
  );
}
