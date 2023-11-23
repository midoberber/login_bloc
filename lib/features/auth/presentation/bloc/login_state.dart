part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginSuccessState extends LoginState {
  final String userName;

  const LoginSuccessState({required this.userName});

  @override
  List<Object> get props => [userName];
}

final class LoginFailureState extends LoginState {
  final String errorMesssage;

  const LoginFailureState({required this.errorMesssage});
  @override
  List<Object> get props => [errorMesssage];
}
