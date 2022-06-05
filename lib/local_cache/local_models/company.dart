import 'package:equatable/equatable.dart';
import "package:flutter/material.dart";



class LocalCompany extends Equatable {
   String? id;
  String companyname;
  String companywebsite;
  String address;
  String dedicatedfield;
  String? password;


   LocalCompany({
    this.id,
    required this.companyname,
    required this.companywebsite,
    required this.address,
    required this.dedicatedfield,
  this.password,
  });

  @override
  List<Object?> get props => [];

     factory LocalCompany.fromJson(Map<String, dynamic> json) {
    return LocalCompany(
       id : json['_id'],
        companyname : json['company_name'],
        companywebsite :json['Company_website'],
        address : json['Address'],
        password:json['password'],
        dedicatedfield : json['dedicated_field']);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "company_name": companyname,
        "Company_website": companywebsite,
        "password": password,
        "Address": address,
        "dedicated_field": dedicatedfield,
      };
        factory LocalCompany.fromApi (Map<String, dynamic> json){
    return LocalCompany(
       id : json['_id'],
        companyname : json['company_name'],
        companywebsite :json['Company_website'],
        address : json['Address'],
        password:json['password'],
        dedicatedfield : json['dedicated_field']);
  }
}