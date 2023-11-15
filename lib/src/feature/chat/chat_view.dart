import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/app.dart';
import 'package:flutter_riverpod_base/src/feature/chat/message_builder.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:go_router/go_router.dart';
import '../../res/assets.dart';

class ChatView extends StatefulWidget {
  static String routePath = '/chat-view';
  final String uid;
  const ChatView({super.key, required this.uid});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.primaryBlue,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(20), child: SizedBox.shrink()),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(left: 20),
            decoration:
                BoxDecoration(color: ColorAssets.white, shape: BoxShape.circle),
            child: const Center(
                child: Icon(
              Icons.arrow_back,
              size: 20,
            )),
          ),
        ),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(ImageAssets.profileImageJpeg)),
          title: Text(
            "Tanmay",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: ColorAssets.white,
                fontSize: 14),
          ),
          subtitle: Text("Online",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ColorAssets.white,
                  fontSize: 12)),
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 20),
            decoration:
                BoxDecoration(color: ColorAssets.white, shape: BoxShape.circle),
            child: const Center(child: Icon(Icons.more_vert)),
          ),
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
              color: ColorAssets.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
          child: ChatComponent()),
    );
  }
}
