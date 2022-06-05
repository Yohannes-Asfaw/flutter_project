import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import '../application/blocs/app_bloc.dart';
import '../application/blocs/app_state.dart';
import '../auth/login/login_bloc.dart';
import '../auth/login/login_state.dart';
import '../models/companies_post.dart';
import '../models/company.dart';
import '../post/blocs/post_bloc.dart';
import '../post/blocs/post_event.dart';
import '../post/blocs/post_state.dart';
import '../repository/companies_repo.dart';
import '../storage/localstorage.dart';

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
  // getcompanyid() async{
  //   var token = await TokenStorage.getCompanyToken('company_token');
  //   Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
  //   var id = payload.values.toList()[0];
  //   return id;
  // }
  @override
  void initState() {
    _description = TextEditingController();
    _subject = TextEditingController();
    // getCompany = CompanyApi.getCompany();
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Post"),
          toolbarHeight: 50,
          backgroundColor: Colors.lightBlue.shade500,
          elevation: 10,
        ),
         body:  BlocBuilder<LoginBloc, LoginState>(
                     builder: (_, state) {
                     
            if (state is CompanyLoginSuccess) {
             
              _companyname.text = state.company.companyname;
              _companywebsite.text = state.company.companywebsite;
              _dedicatedfield.text = state.company.dedicatedfield;
              _address.text = state.company.address;

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
                                      fontSize: 25, ),
                                ),
                              )),
                          const Divider(
                              indent: 2.0,
                              endIndent: 2.0,
                              thickness: 5,
                              ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Here as a company you can Post intern information or any othe message that you have for Students",
                                  style: TextStyle(
                                      fontSize: 15, ),
                                ),
                              )),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Subject",
                              style:
                                  TextStyle(fontSize: 15,),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextFormField(
                                
                                controller: _subject,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  
                                        
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  
                                  ),
                                  hintText: "Write subject of post message",
                                  enabledBorder: OutlineInputBorder(
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
                              "Description",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextFormField(
                                controller: _description,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                                                   ),
                                  hintText: "Write Decription of your post",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
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

                          Align(
                              alignment: Alignment.centerRight,
                              child:                                                            ElevatedButton(
  onPressed: () {
                                 final subject = _subject.text;
                                        final description = _description.text;

                                        if (_formKey.currentState!.validate()) {
  BlocProvider.of<PostBloc>(context).add(PostCreate(
    
   
    description,
    state.company.id,
     subject,

    
  ));
    AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.SUCCES,
                                              animType: AnimType.TOPSLIDE,
                                              title: 'SUCCES',
                                              desc: "Post is added",
                                              btnOkOnPress: () {},
                                            ).show();


                                         
                                        }
      // Respond to button press
  },
  
  child: Text('Post'),
),)
                        ],
                      )));
            }
            
          
            

            return const CircularProgressIndicator();
          },
        ));
  }
}
