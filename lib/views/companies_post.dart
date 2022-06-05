
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../post/blocs/post_bloc.dart';
import '../post/blocs/post_event.dart';
import '../post/blocs/post_state.dart';
import '../post/data_provider/post_data_provider.dart';
import '../post/post_repository/post_repository.dart';

class CompaniesPost extends StatefulWidget {
  const CompaniesPost({Key? key}) : super(key: key);

  @override
  State<CompaniesPost> createState() => _CompaniesPostState();
}

class _CompaniesPostState extends State<CompaniesPost> {
  
 

  // void getCompaniesfromApi() async {
  //   PostApi.getPosts().then((response) {
  //     setState(() {
  //       Iterable list = json.decode(response.body);
  //       postList = list.map((model) => Post.fromJson(model)).toList();
  //     });
  //   });
  // }

  @override
  void initState() {
    // getCompaniesfromApi();
    

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //  final prov = PostDataProvider();
    // final postRepo = PostRepository(prov);
    // final postBloc = BlocProvider.of<PostBloc>(context);
     BlocProvider.of<PostBloc>(context).add(const PostLoad());
    //  return RepositoryProvider<PostRepository>(
    //   create: (context) => postRepo,
    return Scaffold(
        appBar: AppBar(
          title: const Text("Postes"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
      body:BlocBuilder<PostBloc, PostState>(
                     builder: (_, state) {
                       print(state);
                       if (state is PostOperationFailure) {
            return const Text('Could not do course operation');
          }

          if (state is AllPostFetchSuccess) {
            final postList = state.postes;
          
    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        itemCount: postList.length,
                        itemBuilder: (_, index) {
                          // Text(postList[index].companyname);
                          return Card(
                                // color: Colors.lime,
                                elevation: 5,
                                shadowColor: Colors.teal,
                                borderOnForeground: true,
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              top: 17.0),
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/images/phone_10.jpg'))),
                                          child: const Padding(
                                              padding: EdgeInsets.all(10.0)),
                                        ),
                                        Column(children: [
                                          Text(
                                            postList.elementAt(index).company.companyname,
                                            style:const TextStyle(
                              fontSize: 30,
                             
                            ),
                                          ),
                                          Text("@${postList.elementAt(index).company.companywebsite}",style:const TextStyle(
                              fontSize: 20,
                             
                              ),),
                                        ])
                                      ],
                                    ),
                                    const Divider(
                                        indent: 0,
                                        endIndent: 0,
                                        thickness: 0.7,
                                        color: Colors.black),
                                    Column(children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(" A  ${postList.elementAt(index).company.dedicatedfield} Company",style:const TextStyle(
                              fontSize: 20,
                            
                        ),)
                                      ),
                                      
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Text("Info :  ${postList.elementAt(index)
                                            .subject}",style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.centerLeft,
                                        child: Text("  ${postList.elementAt(index)
                                            .description}",style: const TextStyle(fontSize: 14,fontStyle:FontStyle.italic),),
                                      ),
                                     
                                        Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.centerLeft,
                                        child: Text(" If you need Our Address  @${postList.elementAt(index)
                                            .company.address}",style:const TextStyle(
                              fontSize: 19,
                          
                              ))),
                                ]),
                                    ButtonBar(
                                      children: [
                                        OutlinedButton(
                                          child: const Text('About us'),
                                          onPressed: () {/* ... */},
                                        ),
                                        OutlinedButton(
                                          child: const Text('Apply'),
                                          onPressed: () {
                                            BlocProvider.of<PostBloc>(context).add( PostGetfromScreen(postList.elementAt(index)));
                           
                          context.go('/ApplicationForm');
                                       
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ));
                        });}
                                  return const CircularProgressIndicator();

                        }));}}

