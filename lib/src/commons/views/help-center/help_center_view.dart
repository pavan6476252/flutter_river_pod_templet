import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/commons/views/help-center/contact_us_tab.dart';
import 'package:flutter_riverpod_base/src/commons/views/help-center/faq_tab.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:go_router/go_router.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class HelpCenterView extends StatefulWidget {
  static String routePath = '/help-center-view';
  const HelpCenterView({super.key});

  @override
  State<HelpCenterView> createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
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
    return Scaffold(
      backgroundColor: ColorAssets.white,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _buildSliverAppbar(),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  TabBar(
                    // indicatorSize: ,
                    indicatorColor: ColorAssets.primaryBlue,
                    indicator: UnderlineTabIndicator(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 6.0, color: ColorAssets.primaryBlue),
                        insets: EdgeInsets.symmetric(horizontal: 66.0)),
                    indicatorWeight: 6,
                    unselectedLabelColor: ColorAssets.lightGray,
                    labelColor: ColorAssets.primaryBlue,
                    tabs: const [
                      Tab(text: "FAQ"),
                      Tab(text: "Contact Us"),
                    ],
                  ),
                ),

                pinned: true,
                // floating: true,
              ),
              // _chatsBuilder(),
            ];
          },
          body: const TabBarView(children: [
            FaqTab(),
            ContactUsTab(),
          ]),
        ),
      ),
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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
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
              onTap: () {},
            ),
          );
        },
        childCount: chatData.length,
      ),
    );
  }

  SliverAppBar _buildSliverAppbar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      snap: true,
      floating: true,
      pinned: true,
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        child:  GestureDetector(
          onTap: (){
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            size: 20,
        
          ),
        ),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
      title: !_isSliverAppBarExpanded
          ? const Text(
              "Help Center",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
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
                    hintText: "Search",
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
