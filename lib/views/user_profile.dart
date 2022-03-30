import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynotes/models/users.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:mynotes/repository/user_repo.dart';

import '../models/company.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<User> getUser;

  @override
  void initState() {
    getUser = UserApi.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Text(
        'InternSuit-Home',
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 15),
      ),
      FutureBuilder<User>(
        future: getUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data as User;

            return Text(user.address);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      )
    ]));
  }
}
