import 'package:flutter/material.dart';

import 'package:mynotes/views/login.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: "flutter",
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blue),
      theme: ThemeData(),
      home: const LoginView()));
}
