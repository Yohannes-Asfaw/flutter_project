class Application {
  String userName;
  String address;
  int cgpa;
  String description;
  String department;

  Application.fromJson(Map json)
      : userName = json['userName'],
        address = json['Address'],
        cgpa = json['cgpa'],
        department=json['department'],
        description = json['description'];

  Map toJson() {
    return {
      'department':department,
      'userName': userName,
      'cgpa': cgpa,
      'Address': address,
      'description': description
    };
  }
}
