import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynotes/models/companies_post.dart';
import 'package:mynotes/repository/compa_post.dart';

import 'application_form.dart';

class CompaniesPost extends StatefulWidget {
  const CompaniesPost({Key? key}) : super(key: key);

  @override
  State<CompaniesPost> createState() => _CompaniesPostState();
}

class _CompaniesPostState extends State<CompaniesPost> {
  List<Post> postList = <Post>[];
 

  void getCompaniesfromApi() async {
    PostApi.getPosts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        postList = list.map((model) => Post.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    getCompaniesfromApi();
    

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          // Text(postList[index].companyname);
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
                                            postList[index].companywebsite,
                                            style: const TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20),
                                          ),
                                          Text(postList[index].address),
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
                                        child: Text(postList[index]
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
                                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const ApplicationForm( ), settings:  RouteSettings(arguments:postList[index].companyname )),
                          );
                              
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ));
                        });
  }
}
