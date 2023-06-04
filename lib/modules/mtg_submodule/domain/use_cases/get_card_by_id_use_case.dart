import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';
import 'package:sideboard/modules/mtg_submodule/domain/domain_index.dart';

class GetCardByIdUseCase {
  GetCardByIdUseCase(this.repository);
  final MtgRepository repository;

  Future<(Failure?, MtgCardModel?)> execute(String id) async {
    return repository.getMtgCardByID(id);
  }
}
