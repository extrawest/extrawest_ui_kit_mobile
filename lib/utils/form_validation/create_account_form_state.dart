import 'package:extrawest_ui_kit/utils/form_validation/email_validation.dart';
import 'package:extrawest_ui_kit/utils/form_validation/password_validation.dart';
import 'package:formz/formz.dart';

class CreateAccFormState with FormzMixin {
  CreateAccFormState({
    EmailValidation? email,
    this.password = const PasswordValidation.pure(),
    this.status = FormzSubmissionStatus.initial,
  }) : email = email ?? EmailValidation.pure();

  final EmailValidation email;
  final PasswordValidation password;
  final FormzSubmissionStatus status;

  CreateAccFormState copyWith({
    EmailValidation? email,
    PasswordValidation? password,
    FormzSubmissionStatus? status,
  }) {
    return CreateAccFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
