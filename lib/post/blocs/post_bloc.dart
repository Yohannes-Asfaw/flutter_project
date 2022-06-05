import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/post/blocs/post_event.dart';
import 'package:mynotes/post/blocs/post_state.dart';

import '../../models/companies_post.dart';
import '../post_repository/post_repository.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostLoading()) {
    on<FetchBysubject>((event, emit) async {
      
      try {
        final Post post = await postRepository.fetchBysubject(event.subject);
        emit(PostOperationSuccess(post:post));
      } catch (error) {
        emit(PostOperationFailure(error));
      }
    });
    

    on<PostCreate>((event, emit) async {
      try {
        final post = await postRepository.create(event.description,event.id,event.subject);
        // emit(PostOperationSuccess(post:post));
        final posts =await postRepository.fetchbycompanyname(event.id);
        emit(FetchByCompanynameSuccess(posts));
      } catch (error) {
        emit(PostOperationFailure(error));
      }
    });
    on<PostLoad>((event, emit) async {
      try {
         final posts = await postRepository.fetchAll();
        emit(AllPostFetchSuccess(posts));
      } catch (error) {
        emit(PostOperationFailure(error));
      }
    });
    
    on<PostUpdate>((event, emit) async {
      try {
        
      await postRepository.update(event.id,event.subject,event.description,event.Companyid);
     
      emit(PostLoading());
      
      final posts =await postRepository.fetchbycompanyname(event.Companyid);
      emit(FetchByCompanynameSuccess(posts));
      } catch (error) {
        emit(PostOperationFailure(error));
      }
    });
    on<PostGetfromScreen>((event, emit) async {
      try {
        emit(PostgetfromScreenSucccess(event.post));
      } catch (error) {
        emit(PostOperationFailure(error));
      }
    });

    on<PostDelete>((event, emit) async {
      try {
        await postRepository.delete(event.subject);
        emit(PostLoading());
      final posts =await postRepository.fetchbycompanyname(event.id);
      emit(FetchByCompanynameSuccess(posts));
      } catch (error) {
        emit(PostOperationFailure(error));
      }
    });
    on<FetchByCompanyname>((event, emit) async {
      try {
        final posts =await postRepository.fetchbycompanyname(event.companyname);
        emit(FetchByCompanynameSuccess(posts));
      } catch (error) {
        emit(PostOperationFailure(error));
      }
    });
  }
}
