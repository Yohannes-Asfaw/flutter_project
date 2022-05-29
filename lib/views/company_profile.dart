import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:http/http.dart' as http;
import 'package:mynotes/views/login.dart';


import '../models/company.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({Key? key}) : super(key: key);

  @override
  _CompanyProfileState createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  late Future<Company> getCompany;
  late final TextEditingController _companyname = TextEditingController();
  late final TextEditingController _companyWebsite = TextEditingController();
  late final TextEditingController _dedicatedfield = TextEditingController();
  late final TextEditingController _address = TextEditingController();
     final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getCompany = CompanyApi.getCompany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.teal),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/phone_10.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: SingleChildScrollView(
              child: Column(children: [
                const Text(
                  'InternSuit-Home',
                  // textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15),
                ),
                FutureBuilder<Company>(
                  future: getCompany,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Company company = snapshot.data as Company;
                      _companyname.text = company.companyname;
                      _companyWebsite.text = company.companywebsite;
                      _dedicatedfield.text = company.dedicatedfield;
                      _address.text = company.address;
            
                      return Form(
                         key: _formKey,
                      
                          child: SingleChildScrollView(
                            child: Column(children: [
                                                Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 17.0),
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/phone_10.jpg'))),
                            child: const Padding(padding: EdgeInsets.all(10.0)),
                                                ),
                                                Text(
                            company.companyname,
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
                                        style: const TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          labelText: 'Company Name',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic),
                                          prefixIcon: Icon(
                                            Icons.business,
                                            color: Colors.black,
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
                                        style: const TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          labelText: 'Company Website',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic),
                                          prefixIcon: Icon(
                                            Icons.business,
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
                                        style: const TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          labelText: 'Company Address',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic),
                                          prefixIcon: Icon(
                                            Icons.business,
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
                                        style: const TextStyle(color: Colors.black),
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          labelText: 'Dedicated Field',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic),
                                          prefixIcon: Icon(
                                            Icons.business,
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
                                       Container(
                                                  height: 50,
                                                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                                                  margin: const EdgeInsets.only(bottom: 20, top: 15),
                                                  child: OutlinedButton(
                                                        style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                // backgroundColor: Colors.blue,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                                        ),
                                                        child: const Text(
                                'Edit filled data',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                                                        ),
                                                        onPressed: () async {
                                final companyname = _companyname.text;
                                final companywebsite = _companyWebsite.text;
                                final dedicatedfield = _dedicatedfield.text;
                                final address = _address.text;
                                                      
                                if (_formKey.currentState!.validate()) {
                                  final response = await http.put(
                                    Uri.parse('http://127.0.0.1:3000/put/company/${company.companyname}'),
                                    headers: <String, String>{
                                      'Content-Type':
                                          'application/json; charset=UTF-8',
                                          
                                    },
                                    body: jsonEncode(<String, String>{
                                      'company_name': companyname,
                                      'Company_website': companywebsite,
                                      'dedicated_field': dedicatedfield,
                                      'Address': address,
                                    }),
                                  );
                                    if (response.statusCode == 400) {
                                    const snackBar = SnackBar(
                                        content:
                                            Text('Please fill the Dedicated Field'),
                                        backgroundColor: Colors.red,
                                        duration: Duration(milliseconds: 500));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else if (response.statusCode == 200) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginView()),
                                    );
                                                      
                                  }}}))
                                              
                                                ]),
                              ))]),
                          ));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
            
                    return const CircularProgressIndicator();
                  },
                )
              ]),
            )));
  }
}
