import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/chat/chat_view.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/widgets/sliverAppbarwithSearchbar.dart';
import 'package:go_router/go_router.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  bool _isSliverAppBarExpanded = false;
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        _isSliverAppBarExpanded =
            (scrollController.hasClients && scrollController.offset > 50);
      });
    });
  }

  String searchTerm = '';
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return CustomScrollView(
      
      controller: scrollController,
      slivers: [
        SliverAppbarwithSearchBar(
          statusbarColor:color.primary,
          context: context,
          controller: textEditingController,
          title: "Chat",
          isSliverAppBarExpanded: _isSliverAppBarExpanded,
          onChange: (val) {
            searchTerm = val;
            setState(() {});
          },
        ),
        _chatsBuilder()
      ],
    );
  }

  Widget _chatsBuilder() {
    final List<Map<String, dynamic>> chatData = [
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'Hey, how are you doing?',
        'unread': 2,
      },
      {
        'name': 'Other Person',
        'image':
            'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'I am doing great, thanks for asking. How about you?',
        'unread': 0,
      },
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message':
            'I am doing well too, thanks. What have you been up to lately?',
        'unread': 1,
      },
      {
        'name': 'Other Person',
        'image':
            'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'Not much, just working on some projects. How about you?',
        'unread': 0,
      },
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message':
            'Same here, just trying to stay productive. Have a good day!',
        'unread': 0,
      },
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'Hey, how are you doing?',
        'unread': 2,
      },
      {
        'name': 'Other Person',
        'image':
            'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'I am doing great, thanks for asking. How about you?',
        'unread': 0,
      },
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message':
            'I am doing well too, thanks. What have you been up to lately?',
        'unread': 1,
      },
      {
        'name': 'Other Person',
        'image':
            'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'Not much, just working on some projects. How about you?',
        'unread': 0,
      },
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message':
            'Same here, just trying to stay productive. Have a good day!',
        'unread': 0,
      },
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'Hey, how are you doing?',
        'unread': 2,
      },
      {
        'name': 'Other Person',
        'image':
            'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'I am doing great, thanks for asking. How about you?',
        'unread': 0,
      },
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message':
            'I am doing well too, thanks. What have you been up to lately?',
        'unread': 1,
      },
      {
        'name': 'Other Person',
        'image':
            'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message': 'Not much, just working on some projects. How about you?',
        'unread': 0,
      },
      {
        'name': 'You',
        'image':
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'time': '09:34 PM',
        'message':
            'Same here, just trying to stay productive. Have a good day!',
        'unread': 0,
      },
    ];
return SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, int index) {
      final Map<String, dynamic> chat = chatData[index];
      final String name = chat['name'].toString().toLowerCase();
      final String message = chat['message'].toString().toLowerCase();

      bool isSearchMatch = searchTerm.isEmpty ||
          name.contains(searchTerm.toLowerCase()) ||
          message.contains(searchTerm.toLowerCase());

      if (!isSearchMatch) {
        return SizedBox.shrink();
      }

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: ColorAssets.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: ColorAssets.lightGray.withOpacity(0.5),
            ),
          ],
        ),
        child: ListTile(
          leading: Badge(
            alignment: Alignment.bottomRight,
            textColor: Colors.green,
            backgroundColor:
                index % 3 == 0 ? Colors.green : ColorAssets.lightGray,
            smallSize: 10,
            child: CircleAvatar(
              backgroundImage: NetworkImage(chat['image']),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chat['name'],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: ColorAssets.blackFaded,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                chat['time'],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: ColorAssets.lightGray,
                ),
              ),
            ],
          ),
          subtitle: Text(
            chat['message'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: ColorAssets.lightGray,
            ),
          ),
          onTap: () {
            context.push(ChatView.routePath);
          },
        ),
      );
    },
    childCount: chatData.length,
  ),
);
  }}