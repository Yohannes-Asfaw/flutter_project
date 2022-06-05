import '../../models/users.dart';
import '../data_provider/user_data_provider.dart';


class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository(this.dataProvider);

  Future<User> create(User user) async {
    return await dataProvider.create(user);
  }

  Future<User> update(String userName , User user) async {
    return await dataProvider.update(userName, user);
  }
  Future<User> fetchByuserName(String userName) async {
    return await dataProvider.fetchByuserName(userName);
  }
  


  Future<void> delete(String userName) async {
    await dataProvider.delete(userName);
  }
  Future<List<User>> fetchAll() async {
    return await dataProvider.fetchAll();
  }
}
