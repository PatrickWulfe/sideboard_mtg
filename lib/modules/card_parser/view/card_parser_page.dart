import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sideboard/modules/card_parser/card_parser_index.dart';

class CardParserPage extends StatelessWidget {
  const CardParserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<CardParserBloc>(),
      child: ScreenTypeLayout.builder(
        mobile: (context) => const MobileCardParserView(),
      ),
    );
  }
}
