import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard/modules/card_parser/bloc/bloc_index.dart';

import '../../mtg_submodule/domain/domain_index.dart';

class MobileCardParserView extends HookWidget {
  const MobileCardParserView({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final bloc = Modular.get<CardParserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Parser'),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          bloc.add(CardParserEvent.textSubmitted(textController.text));
        },
        child: const Icon(Icons.arrow_right),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Row(
                children: [
                  IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(Icons.paste),
                  )
                ],
              ),
            ),
            BlocBuilder<CardParserBloc, CardParserState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return Expanded(
                      child: TextField(
                        controller: textController,
                        maxLines: 99,
                      ),
                    );
                  },
                  loading: (inputText) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loaded: (cards, errors) {
                    return Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 64,
                            child: TextField(
                              controller: textController,
                              maxLines: 99,
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: .7,
                              ),
                              itemCount: cards.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: CardGridTile(card: cards[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (failure) {
                    return Expanded(
                      child: TextField(
                        controller: textController,
                        maxLines: 99,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardGridTile extends StatelessWidget {
  const CardGridTile({
    required this.card,
    super.key,
  });

  final MtgCardEntity card;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Card(
      child: Column(
        children: [
          Expanded(
            child: card.imageUris != null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      card.imageUris!.normal.toString(),
                      fit: BoxFit.cover,
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
          Text(
            card.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTheme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
