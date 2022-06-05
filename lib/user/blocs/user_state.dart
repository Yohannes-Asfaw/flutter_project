import 'package:equatable/equatable.dart';
import 'package:mynotes/models/users.dart';


abstract class UserState extends Equatable {
  UserState();
  late User? user;
  @override
   List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserOperationSuccess extends UserState {
  UserOperationSuccess({user}){super.user = user;}
  @override
  List<Object> get props => [];
}

class UserOperationFailure extends UserState {
  final Object error;
  UserOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
class UserDeleteSuccess extends UserState {}