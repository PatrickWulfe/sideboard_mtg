import 'package:freezed_annotation/freezed_annotation.dart';

part 'mtg_card.freezed.dart';
part 'mtg_card.g.dart';

@freezed
class MtgCard with _$MtgCard {
  factory MtgCard({
    required String name,
    required String url,
  }) = _MtgCard;

  factory MtgCard.fromJson(Map<String, dynamic> json) =>
      _$MtgCardFromJson(json);
}
