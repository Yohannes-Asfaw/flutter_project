import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mynotes/local_cache/local_db.dart';
import 'package:mynotes/models/company.dart';



class CompanyDataProvider {

  Future<Company> create(Company company) async {
 final response = await http.post(
                              Uri.parse('http://127.0.0.1:3000/reg/company'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                                    
                              },
                              body: jsonEncode(<String, String>{
                                'password': company.password,
                                'company_name': company.companyname,
                                'Company_website': company.companywebsite,
                                'dedicated_field': company.dedicatedfield,
                                'Address': company.address,
                              }),
                            );

    if (response.statusCode == 200) {
      // final company = Company.fromJson(jsonDecode(response.body));
      // final createdcompany = await DBProvider.db.createCompany(company);
      return Company.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create user");
    }
  }

  Future<Company> fetchBycompanyName(String companyname) async {
  // final database = await DBProvider.db;
  //   if (database == null) {
  //   } else {
  //     final company = await DBProvider.db.findCompanyById(companyname);
  //     print(company);
  //     if (company != null) {
  //       return company;
  //     }
  //   }
   
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/get/company/$companyname'));

    if (response.statusCode == 200) {
      // await DBProvider.db.createCompany(Company.fromJson(jsonDecode(response.body)));
      return Company.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  
  }

  
  

  Future<Company> update(String companyName , Company company) async {
                                  final response = await http.put(
                                    Uri.parse('http://127.0.0.1:3000/put/company/${companyName}'),
                                    headers: <String, String>{
                                      'Content-Type':
                                          'application/json; charset=UTF-8',    
                                    },
                                    body: jsonEncode(<String, String>{
                                      'company_name': company.companyname,
                                      'Company_website': company.companywebsite,
                                      'dedicated_field': company.dedicatedfield,
                                      'Address': company.address,
                                    }),
                                  );

    if (response.statusCode == 200) {
      // final company = LocalCompany.fromApi(jsonDecode(response.body));
      //       // catch Store
      // await DBProvider.db.updateCompany(company);
      return Company.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the course");
    }
  }

  Future<void> delete(String companyname) async {
   await http.delete(
                                Uri.parse('http://127.0.0.1:3000/delete/company/$companyname'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                      
                                },  
                              
                              );
}
 Future<List<Company>> fetchAll() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:3000/get/companies'));
    if (response.statusCode == 200) {
      final companies = jsonDecode(response.body) as List;
      return companies.map((c) => Company.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch courses");
    }
  }
}