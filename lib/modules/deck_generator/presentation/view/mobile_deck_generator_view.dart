import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:sideboard/modules/deck_generator/presentation/bloc/deck_generator_bloc.dart';

class MobileDeckGeneratorView extends HookWidget {
  const MobileDeckGeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final bloc = context.read<DeckGeneratorBloc>();

    return BlocBuilder<DeckGeneratorBloc, DeckGeneratorState>(
      builder: (context, state) {
        final appTheme = Theme.of(context);
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (state.messages[index].role ==
                            OpenAIChatMessageRole.user) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            color: appTheme.colorScheme.primaryContainer,
                            child: Text(state.messages[index].content),
                          );
                        }
                        return Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(16),
                          color: appTheme.colorScheme.secondaryContainer,
                          child: Text(state.messages[index].content),
                        );
                      },
                    ),
                  ),
                ),
                TextField(
                  controller: textController,
                  onSubmitted: (value) =>
                      bloc.add(DeckGeneratorEvent.submission(prompt: value)),
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
                const Gap(16),
              ],
            ),
          ),
        );
      },
    );
  }
}
