import 'package:flutter/foundation.dart';

enum MtgColor {
  white,
  blue,
  black,
  red,
  green,
  colorless,
  unknown,
}

extension GetColorByNameExtension on MtgColor {
  String get name => describeEnum(this);
}

MtgColor getMtgColorByName(String name) {
  for (final element in MtgColor.values) {
    if (element.name == name) {
      return element;
    }
  }
  return MtgColor.unknown;
}
