import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

abstract class MtgRepository {
  Future<(Failure?, MtgCardModel?)> getMtgCardByID(String id);
  Future<(Failure?, PaginableList<MtgCardModel>?)> getMtgCardsBySearch(
    String searchStr,
  );
}
