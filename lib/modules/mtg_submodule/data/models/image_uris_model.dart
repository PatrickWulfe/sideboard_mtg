import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart' as sfa;

part 'image_uris_model.freezed.dart';
part 'image_uris_model.g.dart';

@freezed
class ImageUrisModel with _$ImageUrisModel {
  factory ImageUrisModel({
    required Uri small,
    required Uri normal,
    required Uri large,
    required Uri png,
  }) = _ImageUrisModel;

  factory ImageUrisModel.fromJson(Map<String, dynamic> json) =>
      _$ImageUrisModelFromJson(json);

  factory ImageUrisModel.fromSFImageUris(sfa.ImageUris? imageUris) {
    if (imageUris == null) {
      return ImageUrisModel(
        small: Uri(),
        normal: Uri(),
        large: Uri(),
        png: Uri(),
      );
    }
    return ImageUrisModel(
      small: imageUris.small,
      normal: imageUris.normal,
      large: imageUris.large,
      png: imageUris.png,
    );
  }
}
