// in the app
import 'package:app_design_home_screen/screens/auth/auth_screen.dart';
import 'package:app_design_home_screen/screens/home_screen.dart';
import 'package:app_design_home_screen/utils/utils.dart';
import 'package:app_design_home_screen/widgets/widgets.dart';

// packages
import 'package:flutter_svg/flutter_svg.dart' as flutter_svg;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_flutter;

// by flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends AuthRequiredState<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            getAppBar(context),
            // body
            getBody(),
            // bottom navgiation bar
            const GetBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget getAppBar(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: AppTheme.textColor.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 20),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              // explore icon
              flutter_svg.SvgPicture.asset(
                'assets/icons/explore.svg',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              // explore text
              const Text('Explore',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
            ],
          ),
          // right
          Row(
            children: [
              AppIconButton(
                  onTap: () {
                    supabase_flutter.Supabase.instance.client.auth.signOut();
                  },
                  icon: 'assets/icons/write.svg'),
              GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://wallpaperaccess.com/full/4369119.jpg'))),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getBody() {
    return const Expanded(child: HomeScreen());
  }
}

class GetBottomNavigationBar extends StatefulWidget {
  const GetBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<GetBottomNavigationBar> createState() => _GetBottomNavigationBarState();
}

class _GetBottomNavigationBarState extends State<GetBottomNavigationBar> {
  double currentIndex = 0;

  List items = [
    {
      "id": 0,
      'icon': 'assets/icons/home.svg',
      'icon_active': 'assets/icons/home_active.svg',
    },
    {
      "id": 1,
      'icon': 'assets/icons/profile.svg',
      'icon_active': 'assets/icons/profile_active.svg',
    },
    {
      "id": 2,
      'icon': 'assets/icons/bookmark.svg',
      'icon_active': 'assets/icons/bookmark_active.svg',
    }
  ];

  List pages = [
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: AppTheme.textColor.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 20),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomNavigationBarItem(
              icon: currentIndex == 0
                  ? 'assets/icons/home_white.svg'
                  : 'assets/icons/home.svg',
              text: 'Home',
              active: currentIndex == 0,
              onTap: () {
                currentIndex = 0;
                setState(() {});
              }),
          bottomNavigationBarItem(
              icon: currentIndex == 1
                  ? 'assets/icons/profile_white.svg'
                  : 'assets/icons/profile.svg',
              text: 'Friends',
              active: currentIndex == 1,
              onTap: () {
                currentIndex = 1;
                setState(() {});
              }),
          bottomNavigationBarItem(
              icon: currentIndex == 2
                  ? 'assets/icons/bookmark_white.svg'
                  : 'assets/icons/bookmark.svg',
              text: 'Bookmarks',
              active: currentIndex == 2,
              onTap: () {
                currentIndex = 2;
                setState(() {});
              }),
        ],
      ),
    );
  }

  Widget bottomNavigationBarItem(
      {required String icon,
      required String text,
      bool active = false,
      required VoidCallback onTap}) {
    return Column(
      children: [
        AppIconButton(
          onTap: onTap,
          icon: icon,
          backgroundColor:
              active ? AppTheme.primaryColor : AppTheme.backgroundColor,
        ),
        Text(text, style: TextStyle(fontSize: 12))
      ],
    );
  }
}
