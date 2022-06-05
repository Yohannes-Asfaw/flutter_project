import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/applicationform.dart';
import '../application_repository/app_repository.dart';
import 'app_event.dart';
import 'app_state.dart';



class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository appRepository;

  AppBloc({required this.appRepository}) : super(AppLoading()) {
    on<FetchBycompanyName>((event, emit) async {
      
      try {
        final apps = await appRepository.fetchBycompanyName(event.companyName);
        emit(GetByComoanynameFetchSuccess(apps));
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
    

    on<AppCreate>((event, emit) async {
      try {
        await appRepository.create(event.id,event.cgpa,event.description,event.Subject,event.company_name);
        //  final apps =await appRepository.fetchByUserid(event.id);
        // emit(AppFetchByUserIdSuccess(apps));
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });


    on<AppDelete>((event, emit) async {
      try {
        await appRepository.delete(event.subject);
        emit(AppOperationSuccess());
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
     on<AppGetfromScreen>((event, emit) async {
      try {
        emit(AppgetfromScreenSucccess(event.app));
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
     on<AppEvaluation>((event, emit) async {
      try {
        final Application app =await appRepository.appEvaluation(event.subject,event.seen);
       
        emit(AppgetfromScreenSucccess(app));
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
      on<FetchByUserid>((event, emit) async {
      try {
        
        final apps =await appRepository.fetchByUserid(event.id);
        
        emit(AppFetchByUserIdSuccess(apps));
       
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
  }
}
