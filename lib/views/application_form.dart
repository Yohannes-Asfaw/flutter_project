import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mynotes/application/blocs/app_bloc.dart';
import 'package:mynotes/application/blocs/app_event.dart';
import 'package:mynotes/application/blocs/app_state.dart';
import 'package:mynotes/main.dart';
import 'package:mynotes/models/applicationform.dart';
import 'package:mynotes/models/companies_post.dart';
import '../models/users.dart';
import '../post/blocs/post_bloc.dart';
import '../post/blocs/post_event.dart';
import '../post/blocs/post_state.dart';
import '../post/data_provider/post_data_provider.dart';
import '../post/post_repository/post_repository.dart';
import '../storage/localstorage.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({Key? key,}) : super(key: key);

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  late Future<User> getUser;
  late final TextEditingController _name = TextEditingController(); 
  late final TextEditingController _cgpa =TextEditingController();
  late final TextEditingController  _department = TextEditingController();
  late final TextEditingController _address = TextEditingController();
  late final TextEditingController _description= TextEditingController();
  

  final _formKey = GlobalKey<FormState>();
    getid() async {
    var id = await TokenStorage.getUserToken('user_token');
    
    return id.toString();}
  @override
  void initState() {
    
    // getUser = UserApi.getUser();
    super.initState();
  }

  @override
  void dispose() {
    _description.dispose();
    // _name.dispose();
    // _department.dispose();
    _cgpa.dispose();
    // _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);

    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text("Application"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
       body:BlocBuilder<PostBloc, PostState>(
                     builder: (_, state) {  
              return  BlocConsumer<AppBloc, AppState>(
                     listener: ((context, state) {;
                         if (state is FetchByUserid){
                        
                        }

                        if (state is AppOperationFailure){
                         AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.TOPSLIDE,
                                    title: 'ERROR',
                                    desc: 'already applied',
                                    btnOkOnPress: () {},
                                  ).show();}
                     
                      }),
                     builder: (_, state) {
                return Form(
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
                                        fontSize: 25, color: Colors.teal),
                                  ),
                                )),
                            const Divider(
                                indent: 2.0,
                                endIndent: 2.0,
                                thickness: 0.5,
                                color: Colors.black),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Here feel the form and apply for an intern or other jobs",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                )),
                                Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Be serious to fill the real info otherwise you will be disqualified in the further clarification",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                )),
                            // const Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Text(
                            //     "Name",
                            //     style:
                            //         TextStyle(fontSize: 15, color: Colors.black),
                            //   ),
                            // ),
                            // Container(
                            //     padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                            //     child: TextFormField(
                                  
                            //       readOnly: true,
                            //       style: const TextStyle(color: Colors.black),
                            //       controller: _name,
                            //       decoration: InputDecoration(
                            //         errorBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(20),
                            //           borderSide:
                            //               const BorderSide(color: Colors.black),
                            //         ),
                            //         focusedErrorBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(20),
                            //           borderSide:
                            //               const BorderSide(color: Colors.black),
                            //         ),
                            //         hintText: "Write subject of post message",
                            //         hintStyle: const TextStyle(color: Colors.black),
                            //         enabledBorder: OutlineInputBorder(
                            //           borderSide: const BorderSide(color: Colors.black),
                            //           borderRadius: BorderRadius.circular(20),
                            //         ),
                            //         focusedBorder: OutlineInputBorder(
                            //           borderSide:
                            //               const BorderSide(color: Colors.black45),
                            //           borderRadius: BorderRadius.circular(23),
                            //         ),
                            //         // border: OutlineInputBorder(),
                            //       ),
                            //       validator: (value) {
                            //         if (value == null || value.isEmpty) {
                            //           return 'please add a subject';
                            //         } else if (value.trim().length < 4) {
                            //           return 'make a clear subject title';
                            //         }
                            //         return null;
                            //       },
                            //     )),
                            // const Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Text(
                            //     "Addres",
                            //     style: TextStyle(
                            //         fontSize: 15,
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.w700),
                            //   ),
                            // ),
                            // Container(
                            //     padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                            //     child: TextFormField(
                            //       readOnly: true,
                            //       style: const TextStyle(color: Colors.black),
                            //       controller: _address,
                            //       decoration: InputDecoration(
                            //         errorBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(20),
                            //           borderSide:
                            //               const BorderSide(color: Colors.black),
                            //         ),
                            //         focusedErrorBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(20),
                            //           borderSide:
                            //               const BorderSide(color: Colors.black),
                            //         ),
                            //         enabledBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(20),
                            //           borderSide: const BorderSide(color: Colors.black),
                            //         ),
                            //         focusedBorder: OutlineInputBorder(
                            //           borderSide: const BorderSide(color: Colors.black),
                            //           borderRadius: BorderRadius.circular(23),
                            //         ),
                            //         // border: OutlineInputBorder(),
                            //       ),
                            //       validator: (value) {
                            //         if (value == null || value.isEmpty) {
                            //           return 'please add a Address';
                            //         } 
                                    
                            //         return null;
                            //       },
                            //     )),
                                const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "current cgpa",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  controller: _cgpa,
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.black),
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
                                        fontSize: 15, color: Colors.black),
                                  ),
                                )),
                                const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "description",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  style: const TextStyle(color: Colors.black),
                                  controller: _description,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
              
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    hintText: "Write Decription of your post",
                                    hintStyle: const TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.black),
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
                                child: Container(
                                    height: 60,
                                    width: 100,
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 20, 0),
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              width: 1, color: Colors.black),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                        ),
                                        child: const Text(
                                          'APPLY',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15),
                                        ),
                                        onPressed: () async {
                                          var id1= await getid();
                                          
              
                                          if (_formKey.currentState!.validate()) {
                                            
                                                                             BlocProvider.of<AppBloc>(context).add(AppCreate(
                                                id1,
                                                _cgpa.text,
                                                _description.text,
                                                postBloc.state.post!.subject,
                                                postBloc.state.post!.company.id
                                                                             ),);

         
                           BlocProvider.of<AppBloc>(context).add(FetchByUserid(id1));

                              
                                          }
                                        })))
                       ],
                        ))));
                     });
            } 
           )); }
          
}
