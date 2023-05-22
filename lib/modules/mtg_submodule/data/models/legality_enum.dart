import 'package:flutter/foundation.dart';

enum MtgLegality {
  legal,
  notLegal,
  restricted,
  banned,
  unknown,
}

extension GetLegalityByNameExtension on MtgLegality {
  String get name => describeEnum(this);
}

MtgLegality getLegalityByName(String name) {
  for (final element in MtgLegality.values) {
    if (element.name == name) {
      return element;
    }
  }
  return MtgLegality.unknown;
}
