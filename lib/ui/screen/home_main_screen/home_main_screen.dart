import 'package:flutter/material.dart';

import 'feeds_screen/feeds_screen.dart';
import 'home_screen/home_screen.dart';
import 'message_screen/message_screen.dart';
import 'profile_screen/profile_screen.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int currentIndex = 0;
  List bottomNavList = [
    {
      'label': 'Home',
      'icon': Icons.home,
    },
    {
      'label': 'Feeds',
      'icon': Icons.list_alt_outlined,
    },
    {
      'label': 'Message',
      'icon': Icons.message,
    },
    {
      'label': 'Profile',
      'icon': Icons.person,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNav(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
        break;
      case 1:
        return const FeedsScreen();
        break;
      case 2:
        return const MessageScreen();
        break;
      case 3:
        return const ProfileScreen();
        break;
      default:
        const HomeScreen();
    }
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black87,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      items: bottomNavList.map((e) {
        var _index = bottomNavList.indexOf(e);
        return BottomNavigationBarItem(
          label: e['label'],
          icon: IconButton(
            onPressed: () {
              setState(() {
                currentIndex = _index;
              });
            },
            icon: Icon(e['icon']),
          ),
        );
      }).toList(),
    );
  }
}
