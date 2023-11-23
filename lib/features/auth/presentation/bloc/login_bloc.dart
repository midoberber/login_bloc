import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        log(" Username :${event.userName}");
        log(" Password :${event.password}");
        emit(LoginLoadingState());
        if (event.userName == "user" && event.password == "password") {
          await Future.delayed(const Duration(seconds: 3), () {
            emit(LoginSuccessState(userName: event.userName));
          });
        } else {
          await Future.delayed(const Duration(seconds: 2), () {
            emit(const LoginFailureState(errorMesssage: "Invaild Credentials"));
          });
        }
      }
    });
  }
}
