import 'package:extrawest_ui_kit/layouts/create_account.dart';
import 'package:extrawest_ui_kit/utils/form_validation/email_validation.dart';
import 'package:extrawest_ui_kit/utils/form_validation/password_validation.dart';
import 'package:formz/formz.dart';

/// A part of a Form in [CreateAccount] layout, which keeps a state of
/// TextFormFields which needs to be validated
class CreateAccountFormState with FormzMixin {
  CreateAccountFormState({
    EmailValidation? emailValidation,
    PasswordValidation? passwordValidation,
    this.status = FormzSubmissionStatus.initial,
  })  : email = emailValidation ?? EmailValidation.pure(),
        password = passwordValidation ?? PasswordValidation.pure();

  final EmailValidation email;
  final PasswordValidation password;
  final FormzSubmissionStatus status;

  CreateAccountFormState copyWith({
    EmailValidation? email,
    PasswordValidation? password,
    FormzSubmissionStatus? status,
  }) {
    return CreateAccountFormState(
      emailValidation: email ?? this.email,
      passwordValidation: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
