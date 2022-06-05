// ignore_for_file: unnecessary_const
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/views/Company_message.dart';
import 'package:mynotes/views/company_post.dart';
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
    const SingleCompaniesPost(),
    const CompanyProfile(),
    const Companymessage(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 20,
      
             
        
        
        
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            //I want to navigate to a new page Store();
            icon: Icon(Icons.auto_awesome_mosaic_outlined),
            label: 'Postes',
          
          ),
          BottomNavigationBarItem(
            //I want to navigate to a new page Library();
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            //I want to navigate to a new page Store();
            icon: Icon(Icons.message),
            label: 'Message',
            
          ),]),
          
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10.0,
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
