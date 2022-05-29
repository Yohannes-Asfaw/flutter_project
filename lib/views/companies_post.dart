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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Postes"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
    body :ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          // Text(postList[index].companyname);
                          return Card(
                                // color: Colors.lime,
                                elevation: 5,
                                shadowColor: Colors.teal,
                                borderOnForeground: true,
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
                                            postList[index].company.companyname,
                                            style:const TextStyle(
                              fontSize: 30,
                              fontFamily: 'DancingScript',
                              color: Colors.teal),
                                          ),
                                          Text(" our web-site ----> ${postList[index].company.companywebsite}",style:const TextStyle(
                              fontSize: 20,
                              fontFamily: 'DancingScript',
                              color: Colors.teal),),
                                        ])
                                      ],
                                    ),
                                    const Divider(
                                        indent: 0,
                                        endIndent: 0,
                                        thickness: 0.7,
                                        color: Colors.black),
                                    Column(children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(" A  ${postList[index].company.dedicatedfield} Company",style:const TextStyle(
                              fontSize: 20,
                              fontFamily: 'DancingScript',
                              color: Colors.teal),)
                                      ),
                                      const Divider(
                                        indent: 0,
                                        endIndent: 200,
                                        thickness: 0.7,
                                        color: Colors.black),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Text("Info :  ${postList[index]
                                            .subject}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.centerLeft,
                                        child: Text("  ${postList[index]
                                            .description}",style: const TextStyle(fontSize: 14,fontStyle:FontStyle.italic),),
                                      ),
                                      const Divider(
                                        indent: 0,
                                        endIndent: 0,
                                        thickness: 0.7,
                                        color: Colors.black),
                                        Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.centerLeft,
                                        child: Text(" If you need Our Address  @${postList[index]
                                            .company.address}",style:const TextStyle(
                              fontSize: 19,
                              fontFamily: 'DancingScript',
                              color: Colors.teal))),
                                ]),
                                    ButtonBar(
                                      children: [
                                        OutlinedButton(
                                          child: const Text('About us'),
                                          onPressed: () {/* ... */},
                                        ),
                                        OutlinedButton(
                                          child: const Text('Apply'),
                                          onPressed: () {
                                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const ApplicationForm( ), settings:  RouteSettings(arguments:postList[index] )),
                          );
                              
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ));
                        }));
  }
}
