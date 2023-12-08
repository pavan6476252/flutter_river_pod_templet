import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/widgets/simple_app_bar.dart';
import 'package:flutter_riverpod_base/src/core/config/theme/theme.dart';
import 'package:flutter_riverpod_base/src/feature/chat/message_builder.dart';
import 'package:flutter_riverpod_base/src/feature/chat/user_chat_profile.dart';
import 'package:flutter_riverpod_base/src/utils/form_text_field.dart';
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
  bool showsSearchBar = false;
  String searchString = '';
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      // appBar: AppBar(
      //   bottom: showsSearchBar
      //       ? PreferredSize(
      //           preferredSize: const Size.fromHeight(55),
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 15),
      //             child: FormTextField(
      //               onChanged: (val) {
      //                 searchString = val;
      //                 setState(() {});
      //               },
      //               suffixIcon: IconButton(
      //                   onPressed: () {
      //                     toggleSearchBar();
      //                   },
      //                   icon: const Icon(Icons.clear)),
      //               // labelText: 'Email',
      //               hintText: "Search..",
      //             ),
      //           ),
      //         )
      //       : null,
      //   // backgroundColor: Colors.transparent,
      //   leading: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 10),
      //     child: GestureDetector(
      //       onTap: () {
      //         context.pop();
      //       },
      //       child: CircleAvatar(
      //         // radius: 30,
      //         backgroundColor:  colorScheme.secondary.withOpacity(0.1),
      //         child: Icon(Icons.arrow_back, color: colorScheme.background),
      //       ),
      //     ),
      //   ),
      //   title: ListTile(
      //     contentPadding: EdgeInsets.zero,
      //     leading: const CircleAvatar(
      //         radius: 20,
      //         backgroundImage: AssetImage(ImageAssets.profileImageJpeg)),
      //     title: Text(
      //       "Tanmay",
      //       style: TextStyle(
      //           fontWeight: FontWeight.w600,
      //           color: ColorAssets.white,
      //           fontSize: 14),
      //     ),
      //     subtitle: Text("Online",
      //         style: TextStyle(
      //             fontWeight: FontWeight.w500,
      //             color: ColorAssets.white,
      //             fontSize: 12)),
      //             onTap: (){
      //               context.push(UserChatProfileView.routePath);
      //             },
      //   ),
      //   actions: [
      //     ChatPopUpMenuBuilder(toggleSearchBar: toggleSearchBar),
      //   ],
      // ),
      appBar: SimpleAppBar(
        bgColor: colorScheme.primary,
        title: "title",
        titleWidget: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(ImageAssets.profileImageJpeg)),
          title: Text(
            "Tanmay",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colorScheme.onPrimary,
                fontSize: 14),
          ),
          subtitle: Text("Online",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onPrimary,

                  // color: ColorAssets.white,
                  fontSize: 12)),
          onTap: () {
            context.push(UserChatProfileView.routePath);
          },
        ),
        bottom: showsSearchBar
            ? PreferredSize(
                preferredSize: const Size.fromHeight(55),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15 ,bottom: 8),
                  child: FormTextField(
                    onChanged: (val) {
                      searchString = val;
                      setState(() {});
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          toggleSearchBar();
                        },
                        icon: const Icon(Icons.clear)),
                    // labelText: 'Email',
                    hintText: "Search..",
                  ),
                ),
              )
            : null,
        actions: [
          ChatPopUpMenuBuilder(toggleSearchBar: toggleSearchBar),
        ],
      ),

      body: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
          child: ChatComponent(searchString: searchString)),
    );
  }

  void toggleSearchBar() {
    setState(() {
      searchString = '';
      showsSearchBar = !showsSearchBar;
    });
  }
}

class ChatPopUpMenuBuilder extends StatefulWidget {
  const ChatPopUpMenuBuilder({
    Key? key,
    required this.toggleSearchBar,
  }) : super(key: key);
  final VoidCallback toggleSearchBar;
  @override
  State<ChatPopUpMenuBuilder> createState() => _ChatPopUpMenuBuilderState();
}

class _ChatPopUpMenuBuilderState extends State<ChatPopUpMenuBuilder> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return PopupMenuButton<SampleItem>(
      onSelected: (SampleItem item) {
        if (SampleItem.viewProfile == item) {
          context.push(UserChatProfileView.routePath);
        }
      },
      color: colorScheme.surface,
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) {
        TextTheme textTheme = Theme.of(context).textTheme;
        ColorScheme colorScheme = Theme.of(context).colorScheme;
        return <PopupMenuEntry<SampleItem>>[
          // PopupMenuItem<SampleItem>(
          //   value: SampleItem.call,
          //   child: Text(
          //     'Call',
          //     style: textTheme.titleLarge!.copyWith(
          //       fontWeight: FontWeight.w600,
          //       fontSize: 14,
          //     ),
          //   ),
          // ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.search,
            onTap: () => widget.toggleSearchBar(),
            child: Text(
              'Search',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
                fontSize: 14,
              ),
            ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.viewProfile,
            child: Text(
              'View Profile',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.muteNotifications,
            onTap: () => _toggleMuteMode(),
            child: Text(
              muteMode ? 'Unmute Notifications' : 'Mute Notificatios',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.clearChat,
            onTap: () => showClearChatDialog(context),
            child: Text(
              'Clear Chat',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ];
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorAssets.lightGray.withOpacity(0.1),
            shape: BoxShape.circle),
        child:
            Center(child: Icon(Icons.more_vert, color: colorScheme.background)),
      ),
    );
  }

  bool muteMode = false;

  void _toggleMuteMode() {
    muteMode = !muteMode;
    setState(() {});
  }

  void showClearChatDialog(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Clear All Conversation",
          style: TextStyle(color: colorScheme.primary),
        ),
        content: Text(
          "Are you sure you want to clear the entire conversation? This action cannot be undone.",
          style: TextStyle(color: colorScheme.onSecondary),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.secondary),
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: colorScheme.primary),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

enum SampleItem {
  itemOne,
  itemTwo,
  itemThree,
  call,
  viewProfile,
  search,
  muteNotifications,
  clearChat,
}
