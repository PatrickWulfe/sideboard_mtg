import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sideboard/modules/deck_generator/presentation/bloc/deck_generator_bloc.dart';

class MobileDeckGeneratorView extends HookWidget {
  const MobileDeckGeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final bloc = context.read<DeckGeneratorBloc>();

    return BlocBuilder<DeckGeneratorBloc, DeckGeneratorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: textController,
                        onSubmitted: (value) => bloc
                            .add(DeckGeneratorEvent.submission(prompt: value)),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () => bloc.add(
                              DeckGeneratorEvent.submission(
                                prompt: textController.text,
                              ),
                            ),
                            icon: const Icon(Icons.send),
                          ),
                        ),
                      ),
                    ),
                    Flexible(child: Text(state.response)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
