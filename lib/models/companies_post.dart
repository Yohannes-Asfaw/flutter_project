class Post {
  String companyname;
  String companywebsite;
  String address;
  String dedicatedfield;
  String subject;
  String description;

  Post.fromJson(Map json)
      : companyname = json['company_name'],
        companywebsite = json['Company_website'],
        address = json['Address'],
        dedicatedfield = json['dedicated_field'],
        subject=json['subject'],
        description=json['description'];


  Map toJson() {
    return {
      'company_name': companyname,
      'Company_website': companywebsite,
      'dedicated_field': dedicatedfield,
      'Address': address,
      'subject':subject,
      'description':description
      
    };
  }
}
