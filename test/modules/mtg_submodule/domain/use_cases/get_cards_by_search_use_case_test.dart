import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sideboard/core/core_index.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';
import 'package:sideboard/modules/mtg_submodule/domain/domain_index.dart';

import '../../../../data/card_models.dart';

void main() {
  late MockMtgRepositoryImpl mockMtgRepository;
  late MtgRepositoryImpl mtgRepository;
  late GetCardsBySearchUseCase getCardBySearchUseCase;
  late GetCardsBySearchUseCase mockGetCardBySearchUseCase;

  setUp(() {
    // Set up mock repository
    mockMtgRepository = MockMtgRepositoryImpl();
    final mockResponse = PaginableList<MtgCardModel>(
      data: <MtgCardModel>[
        mtgCardModel1,
        mtgCardModel2,
        mtgCardModel3,
      ],
      hasMore: false,
      totalCards: 3,
    );

    when(() => mockMtgRepository.getMtgCardsBySearch(''))
        .thenAnswer((_) => Future.value(Right(mockResponse)));
    when(() => mockMtgRepository.getMtgCardsBySearch('Salver Queen'))
        .thenAnswer(
      (_) => Future.value(
        const Left(
          Failure.repositoryException(
            code: '',
            details: '',
            status: 404,
            warnings: [],
          ),
        ),
      ),
    );

    // Set up real repository
    mtgRepository = MtgRepositoryImpl();

    // Set up use cases
    getCardBySearchUseCase = GetCardsBySearchUseCase(mtgRepository);
    mockGetCardBySearchUseCase = GetCardsBySearchUseCase(mockMtgRepository);
  });

  group('Get cards by search use case ...', () {
    test('Should return a PaginableList of cards from the mock repository.',
        () async {
      final response = await mockGetCardBySearchUseCase.execute('');
      response.fold(
        (l) => fail('Received failure from use case.'),
        (mockList) {
          expect(mockList.length, 3);
        },
      );
    });

    test('Should return a Failure from the mock repository when nothing found.',
        () async {
      final response = await mockGetCardBySearchUseCase.execute('Salver Queen');
      response.fold(
        (failure) {
          failure.maybeMap(
            repositoryException: (value) {
              expect(value.status, 404);
            },
            orElse: () => fail('Expected a RepositoryException'),
          );
        },
        (r) => fail('Expected Failure from use case.'),
      );
    });

    test('Should return a PaginableList of cards from the real repository.',
        () async {
      final response = await getCardBySearchUseCase.execute('Sliver Queen');
      response.fold(
        (l) => fail('Received failure from use case.'),
        (cardList) {
          expect(cardList.length == 1, true);
        },
      );
    });

    test('Should return a Failure from the real repository when nothing found.',
        () async {
      final response = await getCardBySearchUseCase.execute('Salver Queen');
      response.fold(
        (failure) {
          failure.maybeMap(
            repositoryException: (value) {
              expect(value.status, 404);
            },
            orElse: () => fail('Expected a RepositoryException'),
          );
        },
        (r) => fail('Expected Failure from use case.'),
      );
    });
  });
}
