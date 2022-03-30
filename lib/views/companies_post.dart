import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mynotes/models/companies_post.dart';
import 'package:mynotes/repository/compa_post.dart';

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
    return Container(
      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: postList.length,
                          itemBuilder: (context, index) {
                            return Container(child: Text(postList[index].companyname),);
                          })
    );
  }
}
