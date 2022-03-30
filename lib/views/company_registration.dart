// ignore_for_file: unnecessary_this, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mynotes/views/login.dart';

import '../storage/localstorage.dart';

void main() {
  runApp(
    const CompanySignupView(),
  );
}

class CompanySignupView extends StatelessWidget {
  const CompanySignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Sign up",
        home: Scaffold(
            backgroundColor: Colors.teal, body: CompanySignupViewstatefull()));
  }
}

class CompanySignupViewstatefull extends StatefulWidget {
  const CompanySignupViewstatefull({Key? key}) : super(key: key);

  @override
  State<CompanySignupViewstatefull> createState() =>
      _CompanySignupViewstatefullState();
}

class _CompanySignupViewstatefullState
    extends State<CompanySignupViewstatefull> {
  late final TextEditingController _companyname;
  late final TextEditingController _companywebsite;
  late final TextEditingController _dedicatedfield;
  late final TextEditingController _address;
  late final TextEditingController _password;
  late final TextEditingController _confirmpassword;
  var check = 1;
  String selectDepartment = "";

  List<String> categories = [
    "Software Engineering",
    "Electrical Engineering",
    "Biomedical Engineering",
    "Chemical Engineering",
    "Mechanical Engineering"
  ];

  final _formKey = GlobalKey<FormState>();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  void initState() {
    _password = TextEditingController();
    _companyname = TextEditingController();
    _companywebsite = TextEditingController();
    _address = TextEditingController();
    _dedicatedfield = TextEditingController();
    _confirmpassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _companyname.dispose();
    _companywebsite.dispose();
    _address.dispose();
    _dedicatedfield.dispose();
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
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/phone_10.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
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
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: _companyname,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.business,
                          color: Colors.white,
                        ),
                        labelText: 'Company Name',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        } else if (value.trim().length < 3) {
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
                      controller: _companywebsite,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.web_asset_off_outlined,
                          color: Colors.white,
                        ),
                        labelText: 'Company Website',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      validator: (value) {
                        String pattern =
                            r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
                        RegExp regExp = RegExp(pattern);
                        if (value!.isEmpty) {
                          return "Please enter your website";
                        } else if (!(regExp.hasMatch(value))) {
                          return "Website Url must be started from www";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: _address,
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
                              controller: _dedicatedfield,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: Icon(
                                  Icons.location_city,
                                  color: Colors.white,
                                ),
                                labelText: 'Dedicated Field',
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Dedicated Field is required';
                                }
                                return null;
                              },
                            )),
                            PopupMenuButton<String>(
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              onSelected: (String value) {
                                _dedicatedfield.text = value;
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
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
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
                          final companyname = _companyname.text;
                          final companywebsite = _companywebsite.text;
                          final dedicatedfield = _dedicatedfield.text;
                          final address = _address.text;

                          if (_formKey.currentState!.validate()) {
                            final response = await http.post(
                              Uri.parse('http://127.0.0.1:3000/reg/company'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'password': password,
                                'company_name': companyname,
                                'Company_website': companywebsite,
                                'dedicated_field': dedicatedfield,
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
