import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mynotes/application/blocs/app_bloc.dart';
import 'package:mynotes/application/blocs/app_event.dart';
import 'package:mynotes/company/blocs/company_event.dart';
import 'package:mynotes/company/blocs/company_state.dart';
import 'package:mynotes/models/company.dart';
import 'package:mynotes/post/blocs/post_bloc.dart';
import 'package:mynotes/post/blocs/post_event.dart';

import '../company/blocs/company_bloc.dart';
import '../storage/localstorage.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({Key? key}) : super(key: key);

  @override
  _CompanyProfileState createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  late final TextEditingController _companyname = TextEditingController();
  late final TextEditingController _companyWebsite = TextEditingController();
  late final TextEditingController _dedicatedfield = TextEditingController();
  late final TextEditingController _address = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      final companybloc = BlocProvider.of<CompanyBloc>(context); 

       return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
            toolbarHeight: 50,
            backgroundColor: Colors.lightBlue.shade500,
            elevation: 10,
          ),
          
          body: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
            if ( state is CompanyOperationSuccess){ 
              _companyname.text = state.company!.companyname;
              _companyWebsite.text = state.company!.companywebsite;
              _dedicatedfield.text = state.company!.dedicatedfield;
               _address.text = state.company!.address;

              return Container(
                       
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height:double.infinity ,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: SingleChildScrollView(
                            child: Column(children: [
                          
                            
          
                             Form(
                                key: _formKey,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15.0, right: 15.0, top: 50.0,bottom: 10),
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/phone_10.jpg'))),
                                      child: const Padding(padding: EdgeInsets.all(10.0)),
                                    ),
                                    const Divider(
                                        indent: 50,
                                        endIndent: 50,
                                        thickness: 0.7,
                                        color: Colors.black),
 
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                        

                                    
                              ElevatedButton(
  onPressed: () {

     context.go('/');
  },
  
  child: Text('logout'),
),
                          ElevatedButton(
  onPressed: () {
      BlocProvider.of<CompanyBloc>(context).add(CompanyDelete(companybloc.state.company!.id));
       context.go('/');
  },
  
  child: Text('delete'),
),
                                    ],),
      
                                    Text(
                                      state.company!.companyname,
                                      style: const TextStyle(
                                          fontSize: 25, fontStyle: FontStyle.italic),
                                    ),
                                    SizedBox(
                                        width: 330,
                                        child: SingleChildScrollView(
                                          child: Column(children: [
                                            Container(
                                                padding: const EdgeInsets.all(10),
                                                child: TextFormField(
                                                  controller: _companyname,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                   
                                                    labelText: 'Company Name',
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.italic),
                                                    prefixIcon: Icon(
                                                      Icons.account_box_outlined,
                                                      
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'Name is required';
                                                    } else if (value.trim().length < 3) {
                                                      return 'Name length is short';
                                                    }
                                                    return null;
                                                  },
                                                )),
                                            Container(
                                                padding: const EdgeInsets.all(10),
                                                child: TextFormField(
                                                  controller: _companyWebsite,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                    // enabledBorder: OutlineInputBorder(
                                                    //   borderSide:
                                                    //       BorderSide(color: Colors.black),
                                                    // // ),
                                                    // focusedBorder: OutlineInputBorder(
                                                    //   borderSide:
                                                    //       BorderSide(color: Colors.black),
                                                    // ),
                                                    labelText: 'Company Website',
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.italic),
                                                    prefixIcon: Icon(
                                                      Icons.web_asset_outlined,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'Website is required';
                                                    } else if (value.trim().length < 4) {
                                                      return 'password length is short';
                                                    }
                                                    return null;
                                                  },
                                                )),
                                            Container(
                                                padding: const EdgeInsets.all(10),
                                                child: TextFormField(
                                                  controller: _address,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                  
                                                    labelText: 'Company Address',
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.italic),
                                                    prefixIcon: Icon(
                                                      Icons.location_on,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'Address is required';
                                                    } else if (value.trim().length < 4) {
                                                      return 'Address length is short';
                                                    }
                                                    return null;
                                                  },
                                                )),
                                            Container(
                                                padding: const EdgeInsets.all(10),
                                                child: TextFormField(
                                                  controller: _dedicatedfield,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                   
                                                   
                                                    labelText: 'Dedicated Field',
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.italic),
                                                    prefixIcon: Icon(
                                                      Icons.assignment,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'Dedicated Field is required';
                                                    } else if (value.trim().length < 4) {
                                                      return 'Dedicated Field length is short';
                                                    }
                                                    return null;
                                                  },
                                                )),
                                                                                   
                              ElevatedButton(
                                 onPressed: () {
                                               final companyname =
                                                          _companyname.text;
                                                      final companywebsite =
                                                          _companyWebsite.text;
                                                      final dedicatedfield =
                                                          _dedicatedfield.text;
                                                      final address = _address.text;
          
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                       
                                                        BlocProvider.of<CompanyBloc>(
                                                                context)
                                                            .add(CompanyUpdate(
                                                                state.company!.id,
                                                                Company(companyname: companyname, companywebsite: companywebsite, address: address, dedicatedfield: dedicatedfield)));
                                                               
                                                      }
      // Respond to button press
                                              },
  
                                     child: Text('Edit data'),
                                          ),
                                          ]),
                                        ))
                                  ]),
                                ))
          ])
                        ));
             } return Center(child: CircularProgressIndicator(),);}
             ,
          ));
    
  }
}
