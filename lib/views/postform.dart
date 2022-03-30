import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/company.dart';
import '../repository/companies_repo.dart';

class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  late Future<Company> getCompany;
  late final TextEditingController _companyname = TextEditingController();
  late final TextEditingController _companywebsite = TextEditingController();
  late final TextEditingController _dedicatedfield = TextEditingController();
  late final TextEditingController _address = TextEditingController();
  late final TextEditingController _description;
  late final TextEditingController _subject;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _description = TextEditingController();
    _subject = TextEditingController();
    getCompany = CompanyApi.getCompany();
    super.initState();
  }

  @override
  void dispose() {
    _description.dispose();
    _subject.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: const Text("Post"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
        body: FutureBuilder<Company>(
          future: getCompany,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Company company = snapshot.data as Company;
              _companyname.text = company.companyname;
              _companywebsite.text = company.companywebsite;
              _dedicatedfield.text = company.dedicatedfield;
              _address.text = company.address;

              return Form(
                  key: _formKey,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Post Form",
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
                                  "Here as a company you can Post intern information or any othe message that you have for Students",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              )),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Subject",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: _subject,
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
                                  hintStyle: TextStyle(color: Colors.white24),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black45),
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
                              "Description",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: _description,
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
                                  hintText: "Write Decription of your post",
                                  hintStyle: TextStyle(color: Colors.white24),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
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
                                        'Post',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () async {
                                        final subject = _subject.text;
                                        final description = _description.text;

                                        if (_formKey.currentState!.validate()) {
                                          final response = await http.post(
                                            Uri.parse(
                                                'http://127.0.0.1:3000/post'),
                                            headers: <String, String>{
                                              'Content-Type':
                                                  'application/json; charset=UTF-8',
                                            },
                                            body: jsonEncode(<String, String>{
                                              'company_name': _companyname.text,
                                              'Company_website':
                                                  _companywebsite.text,
                                              'dedicated_field':
                                                  _dedicatedfield.text,
                                              'Address': _address.text,
                                              'subject': subject,
                                              'description': description
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
                                              desc: "Post is added",
                                              btnOkOnPress: () {},
                                            ).show();
                                          }
                                        }
                                      })))
                        ],
                      )));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ));
  }
}
