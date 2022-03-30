// ignore_for_file: unnecessary_this, unnecessary_const


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynotes/views/login.dart';
import 'package:mynotes/views/user_registration.dart';

import 'company_registration.dart';

void main() {
  runApp(
    const Homepage(),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  late final TextEditingController _projectname;
  final TextEditingController _startdate = TextEditingController();
  late final TextEditingController _enddate = TextEditingController();
  late final TextEditingController _description;


  @override
  void initState() {
    _projectname = TextEditingController();
    _startdate.text = dateFormat.format(DateTime.now());
    _enddate.text = "";
    _description = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _projectname.dispose();
    _startdate.dispose();
    _enddate.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login",
        home: Scaffold(
            // appBar: AppBar(title: const Text("Login")),
            body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/phone_10.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(bottom: 30, top: 50),
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
                      margin: const EdgeInsets.only(bottom: 100, top: 50),
                      padding: const EdgeInsets.all(10),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Hello,',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 35,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'how are you here you can create your own project with your prference and manage it as you wish enjoy!',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      )),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.white),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                        child: const Text(
                          'Register As Student',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupView()),
                          );
                        },
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(children: const <Widget>[
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
                      ])),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.white),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                        child: const Text(
                          'Register As Company',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CompanySignupView()),
                          );
                        },
                      )),
                  Row(
                    children: <Widget>[
                      const Text(
                        'Already have account?',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20, color: Colors.yellow),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()),
                          );
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ]))));
  }
}
