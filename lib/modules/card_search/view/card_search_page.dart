import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sideboard/modules/card_search/bloc/card_search_bloc.dart';
import 'package:sideboard/modules/card_search/view/mobile_card_search_view.dart';

class CardSearchPage extends StatelessWidget {
  const CardSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<CardSearchBloc>(),
      child: ScreenTypeLayout.builder(
        mobile: (context) => const MobileCardSearchView(),
      ),
    );
  }
}
