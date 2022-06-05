import 'package:equatable/equatable.dart';
import 'package:mynotes/models/applicationform.dart';


abstract class AppState extends Equatable {
  AppState();
  
  @override
   List<Object> get props => [];
}

class AppLoading extends AppState {}

class AppOperationSuccess extends AppState {
 
  AppOperationSuccess();
  @override
  List<Object> get props => [];
}

class AppOperationFailure extends AppState {
  final Object error;
  AppOperationFailure(this.error);
  @override
  List<Object> get props => [error];

}
class GetByComoanynameFetchSuccess extends AppState {
  final List<Application> apps;
  GetByComoanynameFetchSuccess([this.apps = const []]);
  @override
  List<Object> get props => [apps];
}
class AppgetfromScreenSucccess extends AppState {
  final Application app;

  AppgetfromScreenSucccess(this.app);
  @override
  List<Object> get props => [app];
}

class AppEvaluationSucccess extends AppState {
  final Application app;

  AppEvaluationSucccess(this.app);
  @override
  List<Object> get props => [app];
}
class AppFetchByUserIdSuccess extends AppState{
  
final List<Application> apps;
AppFetchByUserIdSuccess(this.apps);
 @override
  List<Object> get props => [apps];
}



