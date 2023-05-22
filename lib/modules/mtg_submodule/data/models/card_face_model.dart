import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart' as sfa;
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

part 'card_face_model.freezed.dart';
part 'card_face_model.g.dart';

@freezed
class CardFaceModel with _$CardFaceModel {
  factory CardFaceModel({
    required String? artist,
    required double? cmc,
    required List<MtgColor>? colors,
    required String? flavorName,
    required String? flavorText,
    required ImageUrisModel? imageUris,
    required Layout? layout,
    required String? loyalty,
    required String? manaCost,
    required String name,
    required String? oracleId,
    required String? oracleText,
    required String? power,
    required String? toughness,
    required String? typeLine,
  }) = _CardFaceModel;

  factory CardFaceModel.fromJson(Map<String, dynamic> json) =>
      _$CardFaceModelFromJson(json);

  factory CardFaceModel.fromSFCardFace(sfa.CardFace cardFace) {
    return CardFaceModel(
      artist: cardFace.artist,
      cmc: cardFace.cmc,
      colors: cardFace.colors?.map((e) => getMtgColorByName(e.name)).toList(),
      flavorName: cardFace.flavorName,
      flavorText: cardFace.flavorText,
      imageUris: ImageUrisModel.fromSFImageUris(cardFace.imageUris),
      layout: getLayoutByName(cardFace.layout.toString()),
      loyalty: cardFace.loyalty,
      manaCost: cardFace.manaCost,
      name: cardFace.name,
      oracleId: cardFace.oracleId,
      oracleText: cardFace.oracleText,
      power: cardFace.power,
      toughness: cardFace.toughness,
      typeLine: cardFace.typeLine,
    );
  }
}
