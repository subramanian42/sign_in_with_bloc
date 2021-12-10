part of 'loginBloc.dart';

abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent {
  String username;
  LoginUsernameChanged({required this.username});
}

class LoginPasswordChanged extends LoginEvent {
  String password;
  LoginPasswordChanged({required this.password});
}

class LoginButtonSubmitted extends LoginEvent {}

class LoginFailure extends LoginEvent {}
