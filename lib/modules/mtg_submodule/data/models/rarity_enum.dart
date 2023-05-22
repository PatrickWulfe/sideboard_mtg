import 'package:flutter/foundation.dart';

enum MtgRarity {
  common,
  uncommon,
  rare,
  special,
  mythic,
  bonus,
  unknown,
}

extension GetRarityByNameExtension on MtgRarity {
  String get name => describeEnum(this);
}

MtgRarity getMtgRarityByName(String name) {
  for (final element in MtgRarity.values) {
    if (element.name == name) {
      return element;
    }
  }
  return MtgRarity.unknown;
}
