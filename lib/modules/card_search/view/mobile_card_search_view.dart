import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sideboard/modules/card_search/bloc/card_search_bloc.dart';

class MobileCardSearchView extends StatelessWidget {
  const MobileCardSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Search'),
      ),
      body: SafeArea(
        child: BlocBuilder<CardSearchBloc, CardSearchState>(
          builder: (context, state) {
            return Column(
              children: [
                const SearchBar(),
                state.when(
                  initial: () => const Center(
                    child: Text('Search for a card'),
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
              ],
            );
          },
        ),
      ),
    );
  }
}
