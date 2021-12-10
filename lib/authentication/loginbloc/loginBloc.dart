import 'package:flutter_bloc/flutter_bloc.dart';
import '../formsubmissionStatus.dart';

part 'loginEvent.dart';
part 'loginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginPasswordChanged>(_updatePassword);
    on<LoginUsernameChanged>(_updateEmail);
    on<LoginButtonSubmitted>(_loginUser);
  }
  _updateEmail(LoginUsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  _updatePassword(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  _loginUser(LoginButtonSubmitted event, Emitter<LoginState> emit) {
    emit(state.copyWith(formstatus: FormSubmitting()));

    if (state.username != null && state.password != null) {
      emit(state.copyWith(formstatus: SubmissionSuccess()));
    } else {
      emit(state.copyWith(
          formstatus: SubmissionFailed(
              Exception("Email and password fields are empty"))));
    }
  }
}
