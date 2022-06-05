import 'package:equatable/equatable.dart';
import 'package:mynotes/models/users.dart';

import '../../models/companies_post.dart';


abstract class PostState extends Equatable {
  PostState();
  late Post? post;
  @override
   List<Object> get props => [];
}

class PostLoading extends PostState {}

class PostOperationSuccess extends PostState {
  PostOperationSuccess({post}){super.post = post;}
  @override
  List<Object> get props => [];
}

class PostOperationFailure extends PostState {
  final Object error;
  PostOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
class AllPostFetchSuccess extends PostState {
  final Iterable<Post> postes;

  AllPostFetchSuccess([this.postes = const []]);
  @override
  List<Object> get props => [postes];
}
class PostgetfromScreenSucccess extends PostState {
  final Post post;

  PostgetfromScreenSucccess(this.post);
  @override
  List<Object> get props => [post];
}
class FetchByCompanynameSuccess extends PostState {
  final Iterable<Post> posts;

  FetchByCompanynameSuccess(this.posts);
  @override
  List<Object> get props => [posts];
}