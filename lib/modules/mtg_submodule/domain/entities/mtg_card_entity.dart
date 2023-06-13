import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

part 'mtg_card_entity.freezed.dart';
part 'mtg_card_entity.g.dart';

@freezed
class MtgCardEntity with _$MtgCardEntity {
  factory MtgCardEntity({
    required String id,
    required String name,
    required String url,
    required Uri rulingsUri,
    required double cmc,
    required int? edhrecRank,
    required LegalitiesModel legalities,
    required String? power,
    required String? toughness,
    required String typeLine,
    required ImageUrisModel? imageUris,
    required MtgRarity rarity,
    required String setName,
  }) = _MtgCardEntity;

  factory MtgCardEntity.fromJson(Map<String, dynamic> json) =>
      _$MtgCardEntityFromJson(json);

  factory MtgCardEntity.fromMtgCardModel(MtgCardModel mtgCardModel) {
    var imageUris = mtgCardModel.imageUris;
    if (mtgCardModel.imageUris == null ||
        mtgCardModel.imageUris!.small.toString() == '') {
      imageUris = mtgCardModel.cardFaces?.first.imageUris;
    }
    return MtgCardEntity(
      id: mtgCardModel.id,
      name: mtgCardModel.name,
      url: mtgCardModel.url,
      rulingsUri: mtgCardModel.rulingsUri,
      cmc: mtgCardModel.cmc,
      edhrecRank: mtgCardModel.edhrecRank,
      legalities: mtgCardModel.legalities,
      power: mtgCardModel.power,
      toughness: mtgCardModel.toughness,
      typeLine: mtgCardModel.typeLine,
      imageUris: imageUris,
      rarity: mtgCardModel.rarity,
      setName: mtgCardModel.setName,
    );
  }
}
