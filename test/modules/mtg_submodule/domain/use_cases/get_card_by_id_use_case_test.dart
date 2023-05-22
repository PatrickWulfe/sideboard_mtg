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
  late GetCardByIdUseCase getMtgCardByIdUseCase;
  late GetCardByIdUseCase mockGetMtgCardByIdUseCase;

  setUp(() {
    // Set up mock repository
    mockMtgRepository = MockMtgRepositoryImpl();
    final mockResponse = mtgCardModel1;

    when(
      () => mockMtgRepository.getMtgCardByID(mtgCard1.id),
    ).thenAnswer((_) => Future.value(Right(mockResponse)));
    when(() => mockMtgRepository.getMtgCardByID('id')).thenAnswer(
      (_) => Future.value(
        const Left(
          Failure.repositoryException(
            code: 'not_found',
            details: '',
            status: 0,
            warnings: [],
          ),
        ),
      ),
    );

    // Set up real repository
    mtgRepository = MtgRepositoryImpl();

    getMtgCardByIdUseCase = GetCardByIdUseCase(mtgRepository);
    mockGetMtgCardByIdUseCase = GetCardByIdUseCase(mockMtgRepository);
  });

  group('Get card by id Use Case...', () {
    test('Should return a card from the mock repository', () async {
      final response = await mockGetMtgCardByIdUseCase.execute(mtgCard1.id);
      response.fold((l) {
        fail('Received failure from use case.');
      }, (mockCard) {
        expect(mockCard != null, true);
        expect(mockCard?.id, mtgCard1.id);
        expect(mockCard?.name, mtgCard1.name);
      });
    });

    test('Should return a real card from the repository', () async {
      const id = '8d4f8e83-fef8-4dfb-9ea6-52e89abe660e';
      final response = await getMtgCardByIdUseCase.execute(id);
      response.fold((l) {
        fail('Received failure from use case.');
      }, (realCard) {
        expect(realCard?.id, id);
      });
    });

    test('Should return failure on an invalid id', () async {
      final response = await mockGetMtgCardByIdUseCase.execute('id');
      response.fold((failure) {
        failure.maybeMap(
          repositoryException: (value) {
            expect(value.code, 'not_found');
          },
          orElse: () => fail('Expected a RepositoryException'),
        );
      }, (noCard) {
        fail('Should have received a failure.');
      });
    });

    test('Should return a failure with code "not_found" from real repository',
        () async {
      final response = await getMtgCardByIdUseCase.execute('id');
      response.fold((failure) {
        failure.maybeMap(
          repositoryException: (value) {
            expect(value.code, 'not_found');
          },
          orElse: () => fail('Expected a RepositoryException'),
        );
      }, (noCard) {
        fail('Should have received a failure.');
      });
    });
  });
}
