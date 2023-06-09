import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

part 'magic_card.freezed.dart';
part 'magic_card.g.dart';

@freezed
class MagicCard with _$MagicCard {
  factory MagicCard({
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
  }) = _MagicCard;

  factory MagicCard.fromJson(Map<String, dynamic> json) =>
      _$MagicCardFromJson(json);

  factory MagicCard.fromMtgCardModel(MtgCardModel mtgCardModel) {
    var imageUris = mtgCardModel.imageUris;
    if (mtgCardModel.imageUris == null ||
        mtgCardModel.imageUris!.small.toString() == '') {
      imageUris = mtgCardModel.cardFaces?.first.imageUris;
    }
    return MagicCard(
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
