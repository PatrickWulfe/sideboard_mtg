import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sideboard_mtg/modules/deck_generator/deck_generator_index.dart';

class DeckGeneratorPage extends StatelessWidget {
  const DeckGeneratorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<DeckGeneratorBloc>(),
      child: Container(),
    );
  }
}
