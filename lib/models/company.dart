class Company {
  String companyname;
  String companywebsite;
  String address;
  String dedicatedfield;

  Company.fromJson(Map json)
      : companyname = json['company_name'],
        companywebsite = json['Company_website'],
        address = json['Address'],
        dedicatedfield = json['dedicated_field'];

  Map toJson() {
    return {
      'company_name': companyname,
      'Company_website': companywebsite,
      'dedicated_field': dedicatedfield,
      'Address': address
    };
  }
}
