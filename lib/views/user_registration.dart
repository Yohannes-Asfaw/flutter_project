// ignore_for_file: unnecessary_this

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mynotes/views/login.dart';

void main() {
  runApp(
    const SignupView(),
  );
}

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Sign up",
        home: Scaffold(
            // appBar: AppBar(title: const Text("Login")),
            body: SignupViewstatefull()));
  }
}

class SignupViewstatefull extends StatefulWidget {
  const SignupViewstatefull({Key? key}) : super(key: key);

  @override
  State<SignupViewstatefull> createState() => _SignupViewstatefullState();
}

class _SignupViewstatefullState extends State<SignupViewstatefull> {
  late final TextEditingController _username;
  late final TextEditingController _fullname;
  late final TextEditingController _university = TextEditingController();
  late final TextEditingController _address;
  late final TextEditingController _department;
  late final TextEditingController _password;
  late final TextEditingController _confirmpassword;
  var check = 1;

  final _formKey = GlobalKey<FormState>();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  List<String> categories = [
    "Software Engineering",
    "Electrical Engineering",
    "Biomedical Engineering",
    "Chemical Engineering",
    "Mechanical Engineering"
  ];

  @override
  void initState() {
    _password = TextEditingController();
    _username = TextEditingController();
    _university.text = "Addis Ababa";
    _address = TextEditingController();
    _department = TextEditingController();
    _fullname = TextEditingController();
    _confirmpassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _fullname.dispose();
    _username.dispose();
    _university.dispose();
    _address.dispose();
    _department.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.teal
                // image: DecorationImage(
                //   image: AssetImage('assets/images/phone_10.jpg'),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: Form(
                key: _formKey,
                child: ListView(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "hello world",
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'DancingScript',
                            color: Colors.white),
                      )),
                  Container(
                      // alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: _username,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.account_box,
                          color: Colors.white,
                        ),
                        labelText: 'User Name',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'User Name is required';
                        } else if (value.trim().length < 4) {
                          return 'User Name length is short';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: _fullname,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                        ),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        } else if (value.trim().length < 5) {
                          return 'Name length is short';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: _university,
                      readOnly: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.school,
                          color: Colors.white,
                        ),
                        labelText: 'University',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              style: const TextStyle(color: Colors.white),
                              controller: _department,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: Icon(
                                  Icons.location_city,
                                  color: Colors.white,
                                ),
                                labelText: 'Department',
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            )),
                            PopupMenuButton<String>(
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              onSelected: (String value) {
                                _department.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return categories
                                    .map<PopupMenuItem<String>>((String value) {
                                  return PopupMenuItem(
                                    child: Text(
                                      value,
                                    ),
                                    value: value,
                                  );
                                }).toList();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: _address,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        labelText: 'Adress',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Address is required';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          // border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
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
                        style: const TextStyle(color: Colors.white),
                        controller: _confirmpassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          // border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.confirmation_num,
                            color: Colors.white,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Password is required';
                          // } else
                          if (value != _password.text) {
                            return 'password is not the same';
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
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          final password = _password.text;
                          final username = _username.text;
                          final fullname = _fullname.text;
                          final department = _department.text;
                          final address = _address.text;
                          final university = _university.text;

                          if (_formKey.currentState!.validate()) {
                            final response = await http.post(
                              Uri.parse('http://127.0.0.1:3000/reg/user'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'password': password,
                                'user_name': username,
                                'full_name': fullname,
                                'department': department,
                                'Address': address,
                                'university': university
                              }),
                            );
                            if (response.statusCode == 409) {
                              const snackBar = SnackBar(
                                  content: Text('User Name already registered'),
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
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()),
                              );
                              check = 1;
                            }
                          }
                        },
                      )),
                  Row(children: const <Widget>[
                    Expanded(
                        child: Divider(
                            indent: 40.0,
                            endIndent: 20.0,
                            thickness: 1,
                            color: Colors.white)),
                    Text("Or", style: TextStyle(color: Colors.white)),
                    Expanded(
                        child: Divider(
                            indent: 20.0,
                            endIndent: 40.0,
                            thickness: 1,
                            color: Colors.white)),
                  ]),
                  Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                      child: TextButton(
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()),
                          );
                        },
                      )),
                ]))));
  }
}
