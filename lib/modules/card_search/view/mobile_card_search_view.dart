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
                SearchBar(),
                // AnimatedList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
