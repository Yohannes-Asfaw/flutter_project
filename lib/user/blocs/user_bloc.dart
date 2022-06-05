import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/models/users.dart';

import '../repository/user_repository.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserLoading()) {
    on<FetchByuserName>((event, emit) async {
      
      try {
        final User user = await userRepository.fetchByuserName(event.userName);
        emit(UserOperationSuccess(user:user));
      } catch (error) {
        emit(UserOperationFailure(error));
      }
    });
    

    on<UserCreate>((event, emit) async {
      try {
        
        User user = await userRepository.create(event.user);
        
        emit(UserOperationSuccess(user:user));
      } catch (error) {
        print(error);
        emit(UserOperationFailure(error));
      }
    });

    on<UserUpdate>((event, emit) async {
      try {
        
        await userRepository.update(event.userName, event.user);
        emit(UserLoading());
        final User user = await userRepository.fetchByuserName(event.userName);
        emit(UserOperationSuccess(user:user));
      } catch (error) {
        emit(UserOperationFailure(error));
      }
    });

    on<UserDelete>((event, emit) async {
      try {
        await userRepository.delete(event.userName);
        emit(UserOperationSuccess());
      } catch (error) {
        emit(UserOperationFailure(error));
      }
    });
  }
}
