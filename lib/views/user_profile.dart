import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynotes/models/users.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:mynotes/repository/user_repo.dart';
import 'package:http/http.dart' as http;
import 'package:mynotes/views/login.dart';


import '../models/company.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<User> getUser;
  late final TextEditingController _username = TextEditingController();
  late final TextEditingController _full_name = TextEditingController();
  late final TextEditingController _university = TextEditingController();
  late final TextEditingController _address = TextEditingController();
  late final TextEditingController _department = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getUser = UserApi.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.teal),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/phone_10.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Column(children: [
              const Text(
                'InternSuit-Home',
                // textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15),
              ),
              FutureBuilder<User>(
                future: getUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    User user = snapshot.data as User;
                    _username.text=user.userName;
                    _full_name.text = user.fullName;
                    _university.text = user.university;
                    _department.text = user.department;
                    _address.text = user.address;

                return  Form( 
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 17.0),
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/phone_10.jpg'))),
                        child: const Padding(padding: EdgeInsets.all(10.0)),
                      ),
                      Text(
                        user.userName,
                        style: const TextStyle(
                            fontSize: 25, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                          width: 330,
                          child: Column(children: [
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _username,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    labelText: 'User Name',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic),
                                    prefixIcon: Icon(
                                      Icons.business,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    } else if (value.trim().length < 4) {
                                      return 'password length is short';
                                    }
                                    return null;
                                  },
                                )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _full_name,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    labelText: 'Full name',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic),
                                    prefixIcon: Icon(
                                      Icons.business,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    } else if (value.trim().length < 4) {
                                      return 'password length is short';
                                    }
                                    return null;
                                  },
                                )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _address,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    labelText: 'User Address',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic),
                                    prefixIcon: Icon(
                                      Icons.business,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    } else if (value.trim().length < 4) {
                                      return 'password length is short';
                                    }
                                    return null;
                                  },
                                )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _department,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    labelText: 'department',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic),
                                    prefixIcon: Icon(
                                      Icons.business,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    } else if (value.trim().length < 4) {
                                      return 'password length is short';
                                    }
                                    return null;
                                  },
                                )),
                                   Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                      margin: const EdgeInsets.only(bottom: 20, top: 15),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                          // backgroundColor: Colors.blue,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                        child: const Text(
                          'Edit filled data',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          final username = _username.text;
                          final fullname = _full_name.text;
                          final department = _department.text;
                          final address = _address.text;

                          if (_formKey.currentState!.validate()) {
                            final response = await http.put(
                              Uri.parse('http://127.0.0.1:3000/put/user/${user.userName}'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                                    
                              },
                              body: jsonEncode(<String, String>{
                                'user_name': username,
                                'full_name': fullname,
                                'department': department,
                                'Address': address,
                              }),
                            );
                            if (response.statusCode == 409) {
                              const snackBar = SnackBar(
                                  content: Text('Company already registered'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(milliseconds: 500));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else if (response.statusCode == 400) {
                              const snackBar = SnackBar(
                                  content:
                                      Text('Please fill the Dedicated Field'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(milliseconds: 500));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else if (response.statusCode == 200) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()),
                              );

                            }
                          }
                        },
                      )),         
                          ])),
                    ]));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              )
            ])));
  }
}
