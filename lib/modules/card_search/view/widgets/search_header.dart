import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
    return BlocBuilder<CardSearchBloc, CardSearchState>(
      builder: (context, state) {
        return Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(16),
            Expanded(
              child: SearchBar(
                controller: searchTextController,
                hintText: 'Search for a card',
                onChanged: (input) => bloc.add(CardSearchEvent.search(input)),
              ),
            ),
            const Gap(32),
            SegmentedButton<ListType>(
              segments: const [
                ButtonSegment(
                  icon: Icon(Icons.grid_view),
                  value: ListType.grid,
                ),
                ButtonSegment(
                  icon: Icon(Icons.list),
                  value: ListType.list,
                ),
              ],
              selected: {state.listType},
              onSelectionChanged: (newSelection) {
                bloc.add(
                  CardSearchEvent.listTypeChanged(
                    newSelection.first,
                  ),
                );
              },
            ),
            // const Gap(32),
            // DropdownButton<String>(
            //   items: [
            //     DropdownMenuItem(child: Text('All'), value: 'All'),
            //     DropdownMenuItem(child: Text(''), value: 'All'),
            //   ],
            //   onChanged: (value) {},
            // ),
            const Gap(16),
          ],
        );
      },
    );
  }
}
