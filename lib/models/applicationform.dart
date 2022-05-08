class Application {
  String userName;
  String address;
  String cgpa;
  String description;
  String department;
  String companyname;

  Application.fromJson(Map json)
      : userName = json['userName'],
        address = json['address'],
        cgpa = json['cgpa'],
        description = json['description'],
        department=json['department'],
        companyname=json['company_name'];


  Map toJson() {
    return {
      
      'userName': userName,
      'address': address,
      'cgpa': cgpa,
      'description': description,
      'department':department,
      'company_name':companyname
    };
  }
}
