import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/views/companies_post.dart';
import 'package:mynotes/views/user_profile.dart';

import 'companies_list.dart';
import 'Usermessage.dart';

class UserNavigation extends StatefulWidget {
  const UserNavigation({Key? key}) : super(key: key);

  @override
  State<UserNavigation> createState() => _UserNavigationState();
}

class _UserNavigationState extends State<UserNavigation> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _children = [
    const CompaniesPost(),
    const UserMessage(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[100],
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            //I want to navigate to a new page Library();
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            //I want to navigate to a new page Store();
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            //I want to navigate to a new page Profile();
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
