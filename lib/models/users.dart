class User {
  String userName;
  String fullName;
  String address;
  String department;
  String university;

  User.fromJson(Map json)
      : userName = json['user_name'],
        fullName = json['full_name'],
        university = json['university'],
        address = json['Address'],
        department = json['department'];

  Map toJson() {
    return {
      'user_name': userName,
      'full_name': fullName,
      'university': university,
      'Address': address,
      'department':department,
    };
  }
}
