part of 'loginBloc.dart';

class LoginState {
  final String? username;
  final String? password;
  bool get isValidusername => username!.length > 4;
  bool get isValidPassword => password!.length > 4;
  final FormSubmissionStatus formstatus;

  const LoginState({
    this.username = '-',
    this.password = '-',
    this.formstatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formstatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formstatus: formstatus ?? this.formstatus,
    );
  }
}
