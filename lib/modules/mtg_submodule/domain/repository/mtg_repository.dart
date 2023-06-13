import 'package:sideboard/core/core_index.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

abstract class MtgRepository {
  Future<(Failure?, MtgCardModel?)> getMtgCardByID(String id);
  Future<(Failure?, MtgCardModel?)> getMtgCardByName(String name);
  Future<(Failure?, PaginableList<MtgCardModel>?)> getMtgCardsBySearch(
    String searchStr,
  );
}
