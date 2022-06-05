import '../../models/companies_post.dart';
import '../data_provider/post_data_provider.dart';


class PostRepository {
  final PostDataProvider dataProvider;
  PostRepository(this.dataProvider);

  Future<String> create(String subject , String id,String description) async {
    try{
    return await dataProvider.create(subject,id,description);}
    catch(e){rethrow;}
  }

  Future<Post> update( String id , String subject,String description,String companyid) async {
    return await dataProvider.update(id,subject, description,companyid);
  }
  Future<Post> fetchBysubject(String subject) async {
    return await dataProvider.fetchBysubject(subject);
  }
  


  Future<void> delete(String userName) async {
    await dataProvider.delete(userName);
  }
  Future<List<Post>> fetchAll() async {
    return await dataProvider.fetchAll();
  }
  Future<List<Post>> fetchbycompanyname(String companyname) async {
    return await dataProvider.fetchbycompanyname(companyname);
  }
}
