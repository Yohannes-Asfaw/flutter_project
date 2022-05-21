import 'package:flutter/material.dart';

class UserMessage extends StatefulWidget {
  const UserMessage({ Key? key }) : super(key: key);

  @override
  State<UserMessage> createState() => _UserMessageState();
}

class _UserMessageState extends State<UserMessage> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
        title: "message",
        
        home: Scaffold(
            appBar: AppBar(title: const Text("message"),
             toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,)));
  }
}