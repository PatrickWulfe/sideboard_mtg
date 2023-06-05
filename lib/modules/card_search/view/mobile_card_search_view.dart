import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:sideboard/modules/card_search/bloc/card_search_bloc.dart';
import 'package:sideboard/modules/card_search/view/widgets/search_header.dart';

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
                  child: state.when(
                    initial: () => const Center(
                      child: Text('Your results will appear here'),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (cards, selectedIndex) => ListView.builder(
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        final card = cards[index];
                        return ListTile(
                          title: Text(card.name),
                          subtitle: Text(card.setName),
                          onTap: () {
                            context
                                .read<CardSearchBloc>()
                                .add(CardSearchEvent.select(index));
                          },
                        );
                      },
                    ),
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
