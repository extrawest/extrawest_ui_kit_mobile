import 'package:extrawest_ui_kit/utils/form_validation/email_validation.dart';
import 'package:extrawest_ui_kit/utils/form_validation/password_validation.dart';
import 'package:formz/formz.dart';

class CreateAccFormState with FormzMixin {
  CreateAccFormState({
    EmailValidation? emailValidation,
    PasswordValidation? passwordValidation,
    this.status = FormzSubmissionStatus.initial,
  })  : email = emailValidation ?? EmailValidation.pure(),
        password = passwordValidation ?? PasswordValidation.pure();

  final EmailValidation email;
  final PasswordValidation password;
  final FormzSubmissionStatus status;

  CreateAccFormState copyWith({
    EmailValidation? email,
    PasswordValidation? password,
    FormzSubmissionStatus? status,
  }) {
    return CreateAccFormState(
      emailValidation: email ?? this.email,
      passwordValidation: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
