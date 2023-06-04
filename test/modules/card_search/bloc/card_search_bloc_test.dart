import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
// import 'card_search_bloc_test.mocks.dart';

// @GenerateNiceMocks([
//   MockSpec<Storage>(),
//   MockSpec<ScryfallRepository>(),
//   MockSpec<CardSearchBloc>(),
// ])
// void main() {
//   late ScryfallRepository scryfallRepository;
//   late Storage storage;
//   final cardSearchBloc = MockCardSearchBloc();

//   setUp(() async {
//     scryfallRepository = MockScryfallRepository();
//     storage = MockStorage();
//     HydratedBloc.storage = storage;

//     initModule(
//       CardSearchModule(),
//       replaceBinds: [
//         Bind.instance<ScryfallRepository>(scryfallRepository),
//       ],
//     );
//   });

//   group('card search bloc ...', () {
//     whenListen(
//       cardSearchBloc,
//       Stream.fromIterable([const CardSearchState.initial()]),
//     );
//     blocTest<CardSearchBloc, CardSearchState>(
//       'emits [Loading, Loaded] when SearchEvent is added.',
//       build: () => cardSearchBloc,
//       act: (bloc) => bloc.add(const CardSearchEvent.search('')),
//       expect: () => [
//         isA<CardSearchState>(),
//       ],
//     );
//   });
// }

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sideboard/modules/card_search/card_search_index.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';
import 'package:sideboard/modules/mtg_submodule/domain/entities/magic_card.dart';

import '../../../data/card_models.dart';

class MockCardSearchBloc extends MockBloc<CardSearchEvent, CardSearchState>
    implements CardSearchBloc {}

class MockMtgRepository extends Mock implements ScryfallRepository {}

void main() {
  late CardSearchBloc cardSearchBloc;
  late MockMtgRepository mtgRepository;

  setUp(() {
    mtgRepository = MockMtgRepository();
    cardSearchBloc = CardSearchBloc();
  });

  tearDown(() {
    cardSearchBloc.close();
  });

  test('initial state is CardSearchState.initial()', () {
    expect(cardSearchBloc.state, equals(const CardSearchState.initial()));
  });

  group('CardSearchEvent.started', () {
    blocTest<CardSearchBloc, CardSearchState>(
      'emits [CardSearchState.initial()] when CardSearchEvent.started is added',
      build: () => cardSearchBloc,
      act: (bloc) async => bloc.add(const CardSearchEvent.started()),
      expect: () => [const CardSearchState.initial()],
    );
  });

  group('CardSearchEvent.search', () {
    const query = 'card name';
    final cardModels = [
      mtgCardModel1,
      mtgCardModel2,
      mtgCardModel3,
    ];
    final cards = [
      mtgCard1,
      mtgCard2,
      mtgCard3,
    ];
    final paginableList =
        PaginableList<MtgCardModel>(data: cardModels, hasMore: false);

    blocTest<CardSearchBloc, CardSearchState>(
      'emits [CardSearchState.loading(), CardSearchState.loaded()] when CardSearchEvent.search is added and API is successful',
      build: () {
        when(() => mtgRepository.getMtgCardsBySearch(any()))
            .thenAnswer((_) async => Future.value((null, paginableList)));
        return cardSearchBloc;
      },
      act: (bloc) async => bloc.add(const CardSearchEvent.search(query)),
      expect: () => [
        const CardSearchState.loading(),
        CardSearchState.loaded(
          cards: cards,
          selectedIndex: null,
        ),
      ],
    );

    final failure = Failure(message: 'API error');

    blocTest<CardSearchBloc, CardSearchState>(
      'emits [CardSearchState.loading(), CardSearchState.error()] when CardSearchEvent.search is added and API returns an error',
      build: () {
        when(() => mtgRepository.getMtgCardsBySearch(any()))
            .thenAnswer((_) async => throw failure);
        return cardSearchBloc;
      },
      act: (bloc) async => bloc.add(const CardSearchEvent.search(query)),
      expect: () => [
        const CardSearchState.loading(),
        CardSearchState.error(failure: failure),
      ],
    );
  });

  group('CardSearchEvent.select', () {
    const index = 1;
    final initialState = CardSearchState.loaded(
      cards: [
        MagicCard(id: '1', name: 'Card 1'),
        MagicCard(id: '2', name: 'Card 2')
      ],
      selectedIndex: null,
    );

    blocTest<CardSearchBloc, CardSearchState>(
      'emits [CardSearchState.loaded()] with selectedIndex set when CardSearchEvent.select is added',
      build: () => cardSearchBloc,
      seed: () => initialState,
      act: (bloc) async => bloc.add(CardSearchEvent.select(index)),
      expect: () => [
        initialState.copyWith(
          selectedIndex: index,
        ),
      ],
    );
  });
}
