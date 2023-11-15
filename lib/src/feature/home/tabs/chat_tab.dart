import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/chat/chat_view.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:go_router/go_router.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  ScrollController scrollController = ScrollController();
  bool _isSliverAppBarExpanded = true;
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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [_buildSliverAppbar(), _chatsBuilder()],
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
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            // padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            decoration: BoxDecoration(
                color: ColorAssets.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      color: ColorAssets.lightGray.withOpacity(0.5))
                ]),
            child: ListTile(
              
              // contentPadding: EdgeInsets.zero,
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
                        color: ColorAssets.blackFaded),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    chat['time'],
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: ColorAssets.lightGray),
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
                    color: ColorAssets.lightGray),
              ),
              // trailing: Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     SizedBox(height:5),
              //     Text(
              //       chat['time'],
              //       style: const TextStyle(
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ],
              // ),
              onTap: () {
                context.push(ChatView.routePath);
              },
            ),
          );
        },
        childCount: chatData.length,
      ),
    );
  }

  SliverAppBar _buildSliverAppbar() {
    return SliverAppBar(
      backgroundColor: ColorAssets.primaryBlue,
      elevation: 0,
      snap: true,
      floating: true,
      pinned: true,
      centerTitle: true,
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: Icon(
          Icons.arrow_back,
        ),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
      title: !_isSliverAppBarExpanded
          ? Text(
              "Chat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorAssets.white,
              ),
            )
          : null,
      bottom: PreferredSize(
        preferredSize: const Size(double.maxFinite, 70),
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 12, top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorAssets.lightBlueGray,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search Agents",
                    hintStyle: TextStyle(color: ColorAssets.lightGray),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorAssets.primaryBlue,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
