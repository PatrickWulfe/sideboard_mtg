import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sideboard/modules/deck_generator/bloc/bloc_index.dart';
import 'package:sideboard/modules/deck_generator/view/widgets/chat_bubble.dart';

class MobileDeckGeneratorView extends HookWidget {
  const MobileDeckGeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final bloc = context.read<DeckGeneratorBloc>();
    final textController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: BlocBuilder<DeckGeneratorBloc, DeckGeneratorState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: AnimateList(
                            effects: [
                              FadeEffect(duration: .2.seconds),
                              const ScaleEffect(),
                            ],
                            children: state.aiMessages.map((e) {
                              if (e.role == OpenAIChatMessageRole.user) {
                                return _UserMessageBubble(
                                  nextMessageInGroup: false,
                                  message: e.content,
                                );
                              }
                              return _SystemMessageBubble(
                                nextMessageInGroup: false,
                                message: e.content,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: textController,
                      onSubmitted: (value) {
                        bloc.add(DeckGeneratorEvent.submission(prompt: value));
                        textController.text = '';
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            bloc.add(
                              DeckGeneratorEvent.submission(
                                prompt: textController.text,
                              ),
                            );
                            textController.text = '';
                          },
                        ),
                      ),
                    ),
                  ],
                );
                // return Chat(
                //   theme: DarkChatTheme(
                //     backgroundColor: appTheme.colorScheme.background,
                //   ),
                //   user: const types.User(id: 'User'),
                //   onSendPressed: (value) {
                //     bloc.add(
                //       DeckGeneratorEvent.submission(prompt: value.text),
                //     );
                //   },
                //   bubbleBuilder: (
                //     child, {
                //     required message,
                //     required nextMessageInGroup,
                //   }) =>
                //       _UserMessageBubble(
                //     message: message,
                //     nextMessageInGroup: nextMessageInGroup,
                //     child: child,
                //   ),
                //   messages: state.aiMessages
                //       .map(
                //         (e) => const types.TextMessage(
                //           id: 'some',
                //           author: types.User(id: 'User'),
                //           // text: e.content,
                //           text: 'coolio',
                //         ),
                //       )
                //       .toList(),
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}

const _messagePadding = 32.0;

class _SystemMessageBubble extends StatelessWidget {
  const _SystemMessageBubble({
    required this.message,
    required this.nextMessageInGroup,
    super.key,
  });

  final String message;
  final bool nextMessageInGroup;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(left: _messagePadding),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: BubbleBackground(
          colors: [
            appTheme.colorScheme.surface,
            appTheme.colorScheme.surfaceVariant,
          ],
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Text(
              message,
              style: appTheme.textTheme.bodyLarge?.copyWith(
                color: appTheme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UserMessageBubble extends StatelessWidget {
  const _UserMessageBubble({
    required this.message,
    required this.nextMessageInGroup,
    super.key,
  });

  final String message;
  final bool nextMessageInGroup;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(right: _messagePadding),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        child: BubbleBackground(
          colors: [
            appTheme.colorScheme.primary,
            appTheme.colorScheme.tertiary,
          ],
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Text(
              message,
              style: appTheme.textTheme.bodyLarge?.copyWith(
                color: appTheme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
