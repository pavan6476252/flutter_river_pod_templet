import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_svg/svg.dart';

class ChatMessage {
  final String sender;
  final String message;
  final DateTime timestamp;

  ChatMessage(
      {required this.sender, required this.message, required this.timestamp});
}

class ChatComponent extends StatefulWidget {
  const ChatComponent({Key? key}) : super(key: key);

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

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => MessageBubble(
                  message: msgdata[index].message,
                  isMe: msgdata[index].sender == '1',
                ),
                itemCount: msgdata.length,
              ),
            ),
          ),
        ),
        messageInputBox(),
      ],
    );
  }

  messageInputBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorAssets.lightBlueGray,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 2,
              // spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(ImageAssets.smile),
              color: ColorAssets.lightBlueGray,
              padding: EdgeInsets.zero,
            ),
            Expanded(
              child: TextFormField(
                maxLines: 5,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorAssets.lightGray)),
              ),
            ),
            SvgPicture.asset(ImageAssets.link),
            const SizedBox(width: 15),
            SvgPicture.asset(ImageAssets.camera),
            const SizedBox(width: 15)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;

  const MessageBubble({Key? key, required this.isMe, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            color: isMe ? ColorAssets.primaryBlue : null,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: isMe ? ColorAssets.white : ColorAssets.blackFaded,
                  fontSize: 14,
                ),
              ),
              if (isMe)
                Positioned(
                  // Add this check to only include Positioned for isMe
                  right: 0,
                  bottom: 0,
                  child: Text(
                    message,
                    style: TextStyle(
                      color: ColorAssets.white,
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
