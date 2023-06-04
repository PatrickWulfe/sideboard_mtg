import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart' as sfa;
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
class MtgCardModel with _$MtgCardModel {
  factory MtgCardModel({
    required String id,
    required String oracleId,
    required Uri rulingsUri,
    required List<CardFaceModel>? cardFaces,
    required double cmc,
    required List<MtgColor> colorIdentity,
    required List<MtgColor>? colorIndicator,
    required List<MtgColor>? colors,
    required int? edhrecRank,
    required List<String> keywords,
    required Layout layout,
    required LegalitiesModel legalities,
    required String? loyalty,
    required String? manaCost,
    required String name,
    required String? oracleText,
    required String? power,
    required String? toughness,
    required String typeLine,
    required String? artist,
    required bool? contentWarning,
    required bool digital,
    required bool foil,
    required bool nonfoil,
    required String? flavorName,
    required String? flavorText,
    required ImageUrisModel? imageUris,
    required MtgRarity rarity,
    required String setName,
    required String url,
  }) = _MtgCardModel;

  factory MtgCardModel.fromJson(Map<String, dynamic> json) =>
      _$MtgCardModelFromJson(json);

  factory MtgCardModel.fromSFCard(sfa.MtgCard mtgCard) {
    return MtgCardModel(
      id: mtgCard.id,
      oracleId: mtgCard.oracleId,
      rulingsUri: mtgCard.rulingsUri,
      cardFaces: mtgCard.cardFaces?.map(CardFaceModel.fromSFCardFace).toList(),
      cmc: mtgCard.cmc,
      colorIdentity:
          mtgCard.colorIdentity.map((e) => getMtgColorByName(e.name)).toList(),
      colorIndicator: mtgCard.colorIndicator
          ?.map((e) => getMtgColorByName(e.name))
          .toList(),
      colors: mtgCard.colors?.map((e) => getMtgColorByName(e.name)).toList(),
      edhrecRank: mtgCard.edhrecRank,
      keywords: mtgCard.keywords,
      layout: getLayoutByName(mtgCard.layout.name),
      legalities: LegalitiesModel.fromSFLegalities(mtgCard.legalities),
      loyalty: mtgCard.loyalty,
      manaCost: mtgCard.manaCost,
      name: mtgCard.name,
      oracleText: mtgCard.oracleText,
      power: mtgCard.power,
      toughness: mtgCard.toughness,
      typeLine: mtgCard.typeLine,
      artist: mtgCard.artist,
      contentWarning: mtgCard.contentWarning,
      digital: mtgCard.digital,
      foil: mtgCard.foil,
      nonfoil: mtgCard.nonfoil,
      flavorName: mtgCard.flavorName,
      flavorText: mtgCard.flavorText,
      imageUris: ImageUrisModel.fromSFImageUris(mtgCard.imageUris),
      rarity: getMtgRarityByName(mtgCard.rarity.name),
      setName: mtgCard.setName,
      url: mtgCard.uri.toString(),
    );
  }
}
