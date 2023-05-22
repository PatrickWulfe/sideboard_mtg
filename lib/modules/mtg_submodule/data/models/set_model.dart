import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_model.freezed.dart';
part 'set_model.g.dart';

@freezed
class MtgSetModel with _$MtgSetModel {
  factory MtgSetModel({
    required String id,
    required String name,
    required String code,
    required int cardCount,
    required bool digital,
    required String iconSvgUri,
  }) = _MtgSetModel;

  factory MtgSetModel.fromJson(Map<String, dynamic> json) =>
      _$MtgSetModelFromJson(json);
}
