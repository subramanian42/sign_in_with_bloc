import 'authentication/formsubmissionStatus.dart';

class UserModel {
  final String? email;
  final String? password;
  final String userId;
  final FormSubmissionStatus formstatus;
  static const empty = UserModel(userId: '-');

  const UserModel({
    this.email,
    this.password,
    this.formstatus = const InitialFormStatus(),
    required this.userId,
  });
  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  UserModel copyWith({
    String? userId,
    String? email,
    String? password,
    FormSubmissionStatus? formstatus,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      password: password ?? this.password,
      formstatus: formstatus ?? this.formstatus,
    );
  }
}
