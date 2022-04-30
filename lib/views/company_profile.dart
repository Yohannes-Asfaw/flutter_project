import 'package:flutter/material.dart';
import 'package:mynotes/repository/companies_repo.dart';


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

                    return Center(
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
                                      return 'Password is required';
                                    } else if (value.trim().length < 4) {
                                      return 'password length is short';
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
                                      return 'Password is required';
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
                                      return 'Password is required';
                                    } else if (value.trim().length < 4) {
                                      return 'password length is short';
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
                                      return 'Password is required';
                                    } else if (value.trim().length < 4) {
                                      return 'password length is short';
                                    }
                                    return null;
                                  },
                                )),
                          ])),
                    ]));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                },
              )
            ])));
  }
}
