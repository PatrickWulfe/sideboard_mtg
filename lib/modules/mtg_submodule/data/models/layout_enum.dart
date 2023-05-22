import 'package:flutter/foundation.dart';

enum Layout {
  normal,
  split,
  flip,
  transform,
  modalDfc,
  meld,
  leveler,
  clazz,
  saga,
  adventure,
  planar,
  scheme,
  vanguard,
  token,
  doubleFacedToken,
  emblem,
  augment,
  host,
  artSeries,
  reversibleCard,
  unknown,
}

extension LayoutNameExtension on Layout {
  String get name => describeEnum(this);
}

Layout getLayoutByName(String name) {
  for (final element in Layout.values) {
    if (element.name == name) {
      return element;
    }
  }
  return Layout.unknown;
}
