import 'package:sideboard/core/core_index.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

abstract class MtgRepository {
  Future<(Failure?, MtgCardModel?)> getMtgCardByID(String id);
  Future<(Failure?, PaginableList<MtgCardModel>?)> getMtgCardsBySearch(
    String searchStr,
  );
}
