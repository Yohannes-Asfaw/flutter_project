import 'dart:convert';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mynotes/models/companies_post.dart';
import 'package:mynotes/post/blocs/post_event.dart';
import 'package:mynotes/repository/compa_post.dart';

import '../application/blocs/app_bloc.dart';
import '../application/blocs/app_state.dart';
import '../company/blocs/company_bloc.dart';
import '../company/blocs/company_event.dart';
import '../post/blocs/post_bloc.dart';
import '../post/blocs/post_state.dart';
import '../storage/localstorage.dart';
import 'application_form.dart';

class SingleCompaniesPost extends StatefulWidget {
  const SingleCompaniesPost({Key? key}) : super(key: key);

  @override
  State<SingleCompaniesPost> createState() => _SingleCompaniesPostState();
}

class _SingleCompaniesPostState extends State<SingleCompaniesPost> {


   getcompanytoken() async {
    var token = await TokenStorage.getCompanyToken();
    Map<String, dynamic> payload =  Jwt.parseJwt(token.toString());
    String companyid =  payload.values.toList()[0];
    

    return companyid;}
    
 

  // void getCompaniesfromApi() async {
  //   PostApi.getsinglePosts().then((response) {
  //     setState(() {
  //       Iterable list = json.decode(response.body);
  //       postList = list.map((model) => Post.fromJson(model)).toList();
  //     });
  //   });
  // }

  @override
  void initState() {
      getcompanytoken() ;
   
    

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        

         return  Scaffold(
           appBar: AppBar(title: const Text("Postes"),
             toolbarHeight: 50,
          backgroundColor: Colors.lightBlue.shade600,
          elevation: 10,), 

           body: BlocConsumer<PostBloc, PostState>(
             listener: (_, state) {
             
             },
                       builder: (_, state) {
                      print(state);
             if (state is FetchByCompanynameSuccess){
           var postList = state.posts;
          

             return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: postList.length,
                          itemBuilder: (context, index) {
                              late final TextEditingController _description= TextEditingController();
                              late final TextEditingController _subject = TextEditingController();
                            _subject.text=postList.elementAt(index).subject;
                            _description.text=postList.elementAt(index).description;
                            final _formKey = GlobalKey<FormState>();
                            return Card(
                              elevation: 10,
                       margin: const EdgeInsets.only(top: 15),
                    child: Form(
                  key: _formKey,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Subject",
                              style:
                                  TextStyle(fontSize: 15,),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                              child: TextFormField(
                                style: const TextStyle(),
                                controller: _subject,
                                // decoration: InputDecoration(
                                //   errorBorder: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(20),
                                //     borderSide:
                                //         const BorderSide(),
                                //   ),
                                //   focusedErrorBorder: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(20),
                                //     borderSide:
                                //         const BorderSide(),
                                //   ),
                                //   hintStyle: const TextStyle(),
                                //   enabledBorder: OutlineInputBorder(
                                //     borderSide: const BorderSide(),
                                //     borderRadius: BorderRadius.circular(20),
                                //   ),
                                //   focusedBorder: OutlineInputBorder(
                                //     borderSide:
                                //         const BorderSide(color: Colors.black45),
                                //     borderRadius: BorderRadius.circular(23),
                                //   ),
                                // ),
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
                               
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: TextFormField(
                                controller: _description,
                                // decoration: InputDecoration(
                                //   errorBorder: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(20),
                                //     borderSide:
                                //         const BorderSide(),
                                //   ),
                                //   focusedErrorBorder: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(20),
                                //     borderSide:
                                //         const BorderSide(),
                                //   ),
                                //   hintText: "Write Decription of your post",
                                //   hintStyle: const TextStyle(color: Colors.white24),
                                //   enabledBorder: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(20),
                                //     borderSide: const BorderSide(),
                                //   ),
                                //   focusedBorder: OutlineInputBorder(
                                //     borderSide: const BorderSide(),
                                //     borderRadius: BorderRadius.circular(23),
                                //   ),
                                //   // border: OutlineInputBorder(),
                                // ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please add a discription';
                                  } else if (value.trim().length < 15) {
                                    return 'please write you description in 15 chararcter';
                                  }
                                  return null;
                                },
                              )),
                          
                            
                                 Column(children: [
                                        // Container(
                                        //   padding: const EdgeInsets.all(10.0),
                                        //   alignment: Alignment.centerLeft,
                                        //   child:  Text(postList.elementAt(index)
                                        //       .subject),
                                        // ),
                                        // Container(
                                        //   padding: const EdgeInsets.all(5.0),
                                        //   alignment: Alignment.centerLeft,
                                        //   child: Text(postList.elementAt(index)
                                        //       .description),
                                        // ),
                                        ButtonBar(
                                      children: [
                                       ElevatedButton.icon(
  onPressed: ()async{
   
  BlocProvider.of<PostBloc>(context).add(PostDelete(postList.elementAt(index).subject,postList.elementAt(index).company.id));
  
    context.go('/CompanyNavigation');
  
  }, 
  icon: const Icon(Icons.delete), 
  label: const Text("Delete")


),
                                        ElevatedButton.icon(
  onPressed: (){
    final subject = _subject.text;
    final description = _description.text;
     if (_formKey.currentState!.validate()){
     
     BlocProvider.of<PostBloc>(context).add(PostUpdate(postList.elementAt(index).id,subject,description,postList.elementAt(index).company.id));
     
    context.go('/CompanyNavigation');
  


     }

  }, 
  icon: const Icon(Icons.edit), 
  label: const Text("Edit data")
)
                                      ],
                                    )

                                      ]),
                        ],
                      ))));
                                  
   
                                    
                                    
                               
                          });
           }
           return Center(child: CircularProgressIndicator());
           }),
         );
}
}