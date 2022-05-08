// ignore_for_file: unnecessary_const
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/views/Company_message.dart';
import 'package:mynotes/views/company_profile.dart';
import 'package:mynotes/views/postform.dart';


class CompanyNavigation extends StatefulWidget {
  const CompanyNavigation({Key? key}) : super(key: key);

  @override
  State<CompanyNavigation> createState() => _CompanyNavigationState();
}

class _CompanyNavigationState extends State<CompanyNavigation> {
  int currentIndex = 0;

  get onPressed => null;

 

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _children = [
    const CompanyProfile(),
    const Companymessage(),
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
          )]),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a Post'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostForm()),
          );
        },
      ));
  }
}
