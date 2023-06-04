import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sideboard/modules/mtg_submodule/mtg_submodule.dart';

void main() {
  setUp(() {
    initModule(
      MtgSubmodule(),
      replaceBinds: [],
    );
  });
  test('mtg submodule binds...', () async {});
}
