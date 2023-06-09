import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:sideboard/modules/card_search/bloc/card_search_bloc.dart';
import 'package:sideboard/modules/card_search/view/widgets/search_header.dart';
import 'package:sideboard/modules/mtg_submodule/domain/entities/magic_card.dart';

class MobileCardSearchView extends HookWidget {
  const MobileCardSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchTextController = useTextEditingController();
    final bloc = context.read<CardSearchBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Search'),
      ),
      body: SafeArea(
        child: BlocBuilder<CardSearchBloc, CardSearchState>(
          builder: (context, state) {
            return Column(
              children: [
                const Gap(16),
                SearchHeader(
                  searchTextController: searchTextController,
                  bloc: bloc,
                ),
                Expanded(
                  child: state.map(
                    initial: (state) => const Center(
                      child: Text('Your results will appear here'),
                    ),
                    loading: (state) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (state) {
                      if (state.listType == ListType.grid) {
                        return GridView.builder(
                          itemCount: state.cards.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: .7,
                          ),
                          itemBuilder: (context, index) {
                            final card = state.cards[index];
                            return CardGridTile(card: card);
                          },
                        );
                      }
                      return ListView.builder(
                        itemCount: state.cards.length,
                        itemBuilder: (context, index) {
                          final card = state.cards[index];
                          return ListTile(
                            title: Text(card.name),
                            subtitle: Text(card.setName),
                            leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                card.imageUris!.small.toString(),
                              ),
                            ),
                            onTap: () {
                              context
                                  .read<CardSearchBloc>()
                                  .add(CardSearchEvent.select(index));
                            },
                          );
                        },
                      );
                    },
                    error: (failure) => Center(
                      child: Text(failure.toString()),
                    ),
                  ),
                ),
              ],
            );
          },
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

  final MagicCard card;

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
                      borderRadius: BorderRadius.circular(16),
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
