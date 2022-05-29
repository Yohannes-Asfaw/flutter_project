import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mynotes/models/companies_post.dart';
import 'package:mynotes/repository/user_repo.dart';
import '../models/users.dart';
import '../storage/localstorage.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({Key? key}) : super(key: key);

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  late Future<User> getUser;
  late final TextEditingController _name = TextEditingController(); 
  late final TextEditingController _cgpa ;
  late final TextEditingController  _department = TextEditingController();
  late final TextEditingController _address = TextEditingController();
  late final TextEditingController _description= TextEditingController();

  final _formKey = GlobalKey<FormState>();
    getid() async {
    var token = await TokenStorage.getUserToken('user_token');
    Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
    var id = payload.values.toList()[0];
    return id.toString();}
  @override
  void initState() {
    

    _cgpa = TextEditingController();


    

    getUser = UserApi.getUser();
    super.initState();
  }

  @override
  void dispose() {
    _description.dispose();
    _name.dispose();
    _department.dispose();
    _cgpa.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final post = 
ModalRoute.of(context)!.settings.arguments as Post ;

    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: const Text("Application"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
        body: FutureBuilder<User>(
          future: getUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User user = snapshot.data as User;
              _name.text = user.fullName;
              _department.text = user.department;
              _address.text = user.address;
              return 
              Form(
                  key: _formKey,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
                      child: SingleChildScrollView(
                      child: Column(
                        children: [ 
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Application Form",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              )),
                          const Divider(
                              indent: 2.0,
                              endIndent: 2.0,
                              thickness: 0.5,
                              color: Colors.white),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Here feel the form and apply for an intern or other jobs",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              )),
                              Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Be serious to fill the real info otherwise you will be disqualified in the further clarification",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              )),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Name",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextFormField(
                                readOnly: true,
                                style: const TextStyle(color: Colors.white),
                                controller: _name,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  hintText: "Write subject of post message",
                                  hintStyle: const TextStyle(color: Colors.white24),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black45),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  // border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please add a subject';
                                  } else if (value.trim().length < 4) {
                                    return 'make a clear subject title';
                                  }
                                  return null;
                                },
                              )),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Addres",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextFormField(
                                readOnly: true,
                                style: const TextStyle(color: Colors.white),
                                controller: _address,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  // border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please add a Address';
                                  } 
                                  
                                  return null;
                                },
                              )),
                              const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "current cgpa",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: _cgpa,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  // border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'cgpa is required';
                                  } 
                                  else if (double.tryParse(value)==null) {
                                    return 'please enter a valid cgpa';
                                  } 
                                  else if (double.tryParse(value)!>4 ||double.tryParse(value)!<0 ) {
                                    return 'please enter a valid cgpa';
                                  } 
                                  

                                  
                                  return null;
                                },
                              )),
                              Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "in the next field please write a paragraph that tell about your achivement and add links to your cv",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              )),
                              const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "description",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextFormField(
                                minLines: 1,
                                maxLines: 5,
                                keyboardType: TextInputType.multiline,
                                style: const TextStyle(color: Colors.white),
                                controller: _description,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),

                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  hintText: "Write Decription of your post",
                                  hintStyle: const TextStyle(color: Colors.white24),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  // border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please add a discription';
                                  } else if (value.trim().length < 15) {
                                    return 'please write you description in 15 chararcter';
                                  }
                                  return null;
                                },
                              )),
                              const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "department",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextFormField(
                                readOnly: true,
                                style: const TextStyle(color: Colors.white),
                                controller: _department,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                 
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  // border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please add a department';
                                  } 
                                  
                                  return null;
                                },
                              )),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  height: 60,
                                  width: 100,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 20, 0),
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            width: 1, color: Colors.white),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      child: const Text(
                                        'APPLY',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      onPressed: () async {
                                        var id1= await getid();

                                        if (_formKey.currentState!.validate()) {
                                          final response = await http.post(
                                            Uri.parse(
                                                'http://127.0.0.1:3000/apply'),
                                            headers: <String, String>{
                                              'Content-Type':
                                                  'application/json; charset=UTF-8',
                                            },
                                            body: jsonEncode(<String, String>{
                                              'user':id1,
                                              'cgpa':
                                              _cgpa.text,
                                              'description': _description.text,
                                              'Subject':post.subject,
                                              'company_name':post.company.companyname

                                            }),
                                          );
                                          if (response.statusCode == 400) {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.ERROR,
                                              animType: AnimType.TOPSLIDE,
                                              title: 'Error',
                                              desc: "Server Error",
                                              btnOkOnPress: () {},
                                            ).show();
                                          } else if (response.statusCode ==
                                              200) {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.SUCCES,
                                              animType: AnimType.TOPSLIDE,
                                              title: 'SUCCES',
                                              desc: "Application is sent",
                                              btnOkOnPress: () {},
                                            ).show();
                                          }
                                          else if (response.statusCode ==
                                              409) {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.ERROR,
                                              animType: AnimType.TOPSLIDE,
                                              title: 'Error code 409',
                                              desc: "You have already Applied",
                                              btnOkOnPress: () {},
                                            ).show();
                                          }
                                          
                                        }
                                      })))
                        ],
                      ))));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
