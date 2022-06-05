
class LocalUser {
  String userName;
  String fullName;
  String address;
  String department;
  String university;
  late var Password;
  late var id;


  LocalUser({
   this.Password,
    required this.address,
    required this.department,
    required this.fullName,
     this.university="addis ababa",
    required this.userName,
    this.id
  });

  
  factory LocalUser.fromJson(Map<String, dynamic> json) {
    return LocalUser(
        userName : json['user_name'],
        fullName :json['full_name'],
        university : json['university'],
        address : json['Address'],
        Password:json['password'],
        id:json['_id'],
        department : json['department']);
        
  }
    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "full_name": fullName,
        "password": Password,
        "Address": address,
        "department": department,
        'university':university,
       
      };
        factory LocalUser.fromApi (Map<String, dynamic> json){
       return LocalUser(
        userName : json['user_name'],
        fullName :json['full_name'],
        university : json['university'],
        address : json['Address'],
        Password:json['password'],
        id:json['_id'],
        department : json['department']);
        
  }
  }

  

