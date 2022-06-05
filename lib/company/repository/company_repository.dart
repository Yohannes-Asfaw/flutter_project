import '../../models/company.dart';
import '../data_provider/company_data_provider.dart';


class CompanyRepository {
  final CompanyDataProvider dataProvider;
  CompanyRepository(this.dataProvider);

  Future<Company> create(Company company) async {
    return await dataProvider.create(company);
  }

  Future<Company> update(String companyname , Company company) async {
    return await dataProvider.update(companyname, company);
  }
  Future<Company> fetchBycompanyName(String companyname) async {
    return await dataProvider.fetchBycompanyName(companyname);
  }
  


  Future<void> delete(String companyname) async {
   await dataProvider.delete(companyname);
  }
  Future<List<Company>> fetchAll() async {
    return dataProvider.fetchAll();
  }
}
