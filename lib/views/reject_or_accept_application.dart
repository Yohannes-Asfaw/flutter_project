import 'package:flutter/material.dart';

class ApplicationEvaluation extends StatefulWidget {
  const ApplicationEvaluation({ Key? key }) : super(key: key);

  @override
  State<ApplicationEvaluation> createState() => _ApplicationEvaluationState();
}

class _ApplicationEvaluationState extends State<ApplicationEvaluation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Application_Evaluation",
        
        home: Scaffold(
            appBar: AppBar(title: const Text("Application Evaluation"),
             toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,),  
            body: Container()));
  }
}