import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:scryfall_api/scryfall_api.dart' as sfa;
import 'package:sideboard/core/core_index.dart';
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

import '../../../../data/card_models.dart';
import 'scryfall_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<sfa.ScryfallApiClient>(),
])
void main() {
  late ScryfallRepository repository;
  late MockScryfallApiClient apiClient;

  setUp(() {
    apiClient = MockScryfallApiClient();
    repository = ScryfallRepository(apiClient: apiClient);
  });

  group('getMtgCardByID', () {
    test('should return a MtgCardModel when the API call is successful',
        () async {
      // arrange
      when(apiClient.getCardById('123')).thenAnswer((_) async => mtgCard1);

      // act
      final result = await repository.getMtgCardByID('123');

      // assert
      expect(result, equals((null, mtgCardModel1)));
      verify(apiClient.getCardById('123')).called(1);
    });

    test('should return a Failure object when the API call fails', () async {
      // arrange
      const failure = Failure.repositoryException(
        code: 'code',
        details: 'details',
        status: 404,
        warnings: ['warning'],
      );
      when(apiClient.getCardById('123')).thenThrow(
        sfa.ScryfallException(
          code: 'code',
          details: 'details',
          status: 404,
          warnings: ['warning'],
        ),
      );

      // act
      final result = await repository.getMtgCardByID('123');

      // assert
      expect(result, equals((failure, null)));
      verify(apiClient.getCardById('123')).called(1);
    });
  });
}
