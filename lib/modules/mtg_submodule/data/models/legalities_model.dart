import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart' as sfa;
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

part 'legalities_model.freezed.dart';
part 'legalities_model.g.dart';

@freezed
class LegalitiesModel with _$LegalitiesModel {
  factory LegalitiesModel({
    required MtgLegality standard,
    required MtgLegality future,
    required MtgLegality historic,
    required MtgLegality gladiator,
    required MtgLegality pioneer,
    required MtgLegality modern,
    required MtgLegality legacy,
    required MtgLegality pauper,
    required MtgLegality vintage,
    required MtgLegality penny,
    required MtgLegality commander,
    required MtgLegality brawl,
    required MtgLegality historicBrawl,
    required MtgLegality alchemy,
    required MtgLegality pauperCommander,
    required MtgLegality duel,
    required MtgLegality oldSchool,
    required MtgLegality premodern,
  }) = _LegalitiesModel;

  factory LegalitiesModel.fromJson(Map<String, dynamic> json) =>
      _$LegalitiesModelFromJson(json);

  factory LegalitiesModel.fromSFLegalities(sfa.Legalities legalities) {
    return LegalitiesModel(
      standard: getLegalityByName(legalities.standard.name),
      future: getLegalityByName(legalities.future.name),
      historic: getLegalityByName(legalities.historic.name),
      gladiator: getLegalityByName(legalities.gladiator.name),
      pioneer: getLegalityByName(legalities.pioneer.name),
      modern: getLegalityByName(legalities.modern.name),
      legacy: getLegalityByName(legalities.legacy.name),
      pauper: getLegalityByName(legalities.pauper.name),
      vintage: getLegalityByName(legalities.vintage.name),
      penny: getLegalityByName(legalities.penny.name),
      commander: getLegalityByName(legalities.commander.name),
      brawl: getLegalityByName(legalities.brawl.name),
      historicBrawl: getLegalityByName(legalities.historicbrawl.name),
      alchemy: getLegalityByName(legalities.alchemy.name),
      pauperCommander: getLegalityByName(legalities.paupercommander.name),
      duel: getLegalityByName(legalities.duel.name),
      oldSchool: getLegalityByName(legalities.oldschool.name),
      premodern: getLegalityByName(legalities.premodern.name),
    );
  }
}
