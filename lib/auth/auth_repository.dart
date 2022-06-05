import 'package:mynotes/auth/login/data_provide/dataprovider.dart';

class AuthenticationRepository {
 final Loginprovider dataProvider;
 AuthenticationRepository(this.dataProvider);

Future<dynamic> login(String username,String password) async {
    return await dataProvider.login(username,password);
  }
  Future<dynamic> companylogin(String companyname,String password) async {
    try{
     
    return await dataProvider.companylogin(companyname,password);
    }
    catch(e){
      rethrow;}
  }

}
