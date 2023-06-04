import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

abstract class MtgRepository {
  Future<GetCardByIdPattern> getMtgCardByID(String id);
  Future<GetCardsBySearchPattern> getMtgCardsBySearch(
    String searchStr,
  );
}
