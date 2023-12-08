import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/chat/message_input_box.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_svg/svg.dart';

class ChatMessage {
  final String sender;
  final String message;
  final DateTime timestamp;

  ChatMessage(
      {required this.sender, required this.message, required this.timestamp});
}

class ChatComponent extends StatefulWidget {
  const ChatComponent({Key? key, required, required this.searchString})
      : super(key: key);

  final String searchString;
  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  final List<ChatMessage> msgdata = List.generate(
    25,
    (index) => ChatMessage(
      sender: Random().nextInt(2) == 0 ? '1' : '2',
      message:
          'This is message $index ${Random().nextInt(2) == 0 ? "Hi there! I'm a photographer, and I'm looking for a studio space to rent for a photoshoot next weekend. " : "Great! We have a photography studio available. What date and time are you looking for?"}',
      timestamp: DateTime.now().subtract(Duration(minutes: index)),
    ),
  );

@override
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  });
}

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ListView.builder(
        controller:  scrollController,
        padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) => MessageBubble(
            searchString: widget.searchString,
            message: msgdata[index].message,
            isMe: msgdata[index].sender == '1',
          ),
          itemCount: msgdata.length,
        ),
        const Positioned(
            bottom: 10, left: 0, right: 0, child: MessageInputBoxWidget())
      ],
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String searchString;

  const MessageBubble(
      {Key? key,
      required this.isMe,
      required this.message,
      required this.searchString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            constraints: const BoxConstraints(
              maxWidth: 283,
            ),
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              // color: color.surfaceVariant,
              color: isMe ? ColorAssets.primaryBlue : color.outlineVariant,
              border: Border.all(
                color: isMe
                    ? Colors.transparent
                    : ColorAssets.blackFaded.withOpacity(0.25),
              ),
              borderRadius: BorderRadius.only(
                topRight: isMe ? Radius.zero : const Radius.circular(15),
                topLeft: isMe ? const Radius.circular(15) : Radius.zero,
                bottomLeft: const Radius.circular(15),
                bottomRight: const Radius.circular(15),
              ),
            ),
            child: Text(
              message,
            ).boldSubString(searchString, context, isMe)),
      ],
    );
  }
}
