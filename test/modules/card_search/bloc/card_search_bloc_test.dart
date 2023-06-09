import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sideboard/modules/card_search/card_search_index.dart';
import 'package:sideboard/modules/mtg_submodule/mtg_submodule_index.dart';

import 'card_search_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<Storage>(),
  MockSpec<ScryfallRepository>(),
])
void main() {
  late ScryfallRepository scryfallRepository;
  late Storage storage;
  late CardSearchBloc bloc;

  setUp(() async {
    scryfallRepository = MockScryfallRepository();
    storage = MockStorage();
    HydratedBloc.storage = storage;

    initModule(
      CardSearchModule(),
      replaceBinds: [
        Bind.instance<ScryfallRepository>(scryfallRepository),
      ],
    );
    bloc = Modular.get<CardSearchBloc>();
  });

  group('card search bloc ...', () {
    whenListen(
      bloc,
      Stream.fromIterable(
        [
          const CardSearchState.initial(
            listType: ListType.grid,
          )
        ],
      ),
    );
    blocTest<CardSearchBloc, CardSearchState>(
      'emits [Loading, Loaded] when SearchEvent is added.',
      build: () => bloc,
      act: (bloc) => bloc.add(const CardSearchEvent.search('')),
      expect: () => [
        isA<CardSearchState>(),
      ],
    );
  });
}
