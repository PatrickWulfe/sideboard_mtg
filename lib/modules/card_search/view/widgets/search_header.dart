import 'package:flutter/material.dart';
import 'package:sideboard/modules/card_search/card_search_index.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
    required this.searchTextController,
    required this.bloc,
  });

  final TextEditingController searchTextController;
  final CardSearchBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchBar(
          controller: searchTextController,
          hintText: 'Search for a card',
          onChanged: (input) => bloc.add(CardSearchEvent.search(input)),
        ),
        DropdownButton(
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
