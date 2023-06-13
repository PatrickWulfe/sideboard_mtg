import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sideboard/core/constants/failure.dart';
import 'package:sideboard/modules/mtg_submodule/domain/domain_index.dart';

import '../../mtg_submodule/data/data_index.dart';

part 'card_parser_bloc.freezed.dart';
part 'card_parser_event.dart';
part 'card_parser_state.dart';

class CardParserBloc extends Bloc<CardParserEvent, CardParserState> {
  CardParserBloc() : super(const _Initial()) {
    on<CardParserEvent>((event, emit) async {
      await event.when(
        started: () async {
          return emit(const CardParserState.initial());
        },
        textSubmitted: (inputText) async {
          return _onTextSubmitted(inputText, emit);
        },
      );
    });
  }

  Future<void> _onTextSubmitted(
    String inputText,
    Emitter<CardParserState> emit,
  ) async {
    emit(CardParserState.loading(inputText: inputText));

    final cards = <MtgCardEntity>[];
    final errors = <String>[];

    final lines = inputText.trim().split('\n');
    for (final line in lines) {
      final regExp = RegExp(
        // Regex for quantity, card name, set (optional),
        // collector number (optional)
        // Should match ChatGPT output and Moxfield exports
        r'(?<quantity>\d+)\s(?<cardName>[^()]*)\s?(?<set>\([^)]*\)\s?)?(?<collectorNumber>\d+)?',
      );
      final match = regExp.firstMatch(line.trim());
      final quantity = int.tryParse(match?.namedGroup('quantity') ?? '');
      if (quantity == null) {
        errors.add(line);
        continue;
      }

      final card = await mtgRepository
          .getMtgCardByName(match?.namedGroup('cardName') ?? '');
      switch (card) {
        case (null, final MtgCardModel card):
          cards.addAll(
            List.generate(
              quantity,
              (_) => MtgCardEntity.fromMtgCardModel(card),
            ),
          );
          break;
        case (Failure _, null):
          errors.add(line);
          break;
      }
    }
    return emit(
      CardParserState.loaded(
        cards: cards,
        errors: errors,
      ),
    );
  }

  final MtgRepository mtgRepository = Modular.get<MtgRepository>();
}
