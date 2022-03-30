import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynotes/models/users.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:mynotes/repository/user_repo.dart';

import '../models/company.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  List<Company> characterList = <Company>[];
  late Future<User> getUser;

  void getCompaniesfromApi() async {
    CompanyApi.getCharacters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => Company.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    getCompaniesfromApi();
    getUser = UserApi.getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Column(children: [
              const Text(
                'InternSuit-Home',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15),
              ),
              Flexible(
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/phone_10.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: characterList.length,
                          itemBuilder: (context, index) {
                            return Card(
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              top: 17.0),
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/images/phone_10.jpg'))),
                                          child: const Padding(
                                              padding: EdgeInsets.all(10.0)),
                                        ),
                                        Column(children: [
                                          Text(
                                            characterList[index].companywebsite,
                                            style: const TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20),
                                          ),
                                          Text(characterList[index].address),
                                        ])
                                      ],
                                    ),
                                    const Divider(
                                        indent: 5,
                                        endIndent: 5,
                                        thickness: 0.5,
                                        color: Colors.black),
                                    Column(children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        alignment: Alignment.centerLeft,
                                        child: const Text("company website"),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(characterList[index]
                                            .companywebsite),
                                      )
                                    ]),
                                    ButtonBar(
                                      children: [
                                        OutlinedButton(
                                          child: const Text('Info'),
                                          onPressed: () {/* ... */},
                                        ),
                                        OutlinedButton(
                                          child: const Text('Apply'),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    scrollable: true,
                                                    title: const Text(
                                                      'Application Form',
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    content: Container(
                                                      width: 400,
                                                      child: Form(
                                                        child: Column(
                                                          children: <Widget>[
                                                            TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    'Name',
                                                                icon: Icon(Icons
                                                                    .account_box),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    'Email',
                                                                icon: Icon(Icons
                                                                    .email),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    'Email',
                                                                icon: Icon(Icons
                                                                    .email),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    'Email',
                                                                icon: Icon(Icons
                                                                    .email),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    'Message',
                                                                icon: Icon(Icons
                                                                    .message),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                          child: Text("Submit"),
                                                          onPressed: () {
                                                            // your code
                                                          })
                                                    ],
                                                  );
                                                });
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          })))
            ])));
  }
}
