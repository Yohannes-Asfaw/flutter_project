import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynotes/models/users.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:mynotes/repository/user_repo.dart';
import 'package:mynotes/views/reject_or_accept_application.dart';

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
                      // width: double.infinity,
                      // decorati  late Future<User> getUser;on: const BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage('assets/images/phone_10.jpg'),
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: characterList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(
          onTap: () {
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (context) {
                  return const ApplicationEvaluation();
                },
              ),
            );
          },
                            child: Card(
                              
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     Column(children: [
                                    //       Text(
                                    //         characterList[index].companywebsite,
                                    //         style: const TextStyle(
                                    //             color: Colors.amber,
                                    //             fontSize: 20),
                                    //       ),
                                    //       Text(characterList[index].address),
                                    //     ])
                                    //   ],
                                    // ),
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
                                  ],
                                )));
                          })))
            ])));
  }
}
