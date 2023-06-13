import 'package:flutter/material.dart';
import 'package:sideboard/modules/mtg_submodule/domain/domain_index.dart';

class ParsedGridWidget extends StatelessWidget {
  const ParsedGridWidget({
    required this.cards,
    super.key,
  });

  final List<MtgCardEntity> cards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Image.network(cards[index].imageUris!.normal.toString()),
        );
      },
    );
  }
}
