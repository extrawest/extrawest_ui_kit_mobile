import 'package:formz/formz.dart';

enum EmailValidationError { invalid, empty }

class EmailValidation extends FormzInput<String, EmailValidationError>
    with FormzInputErrorCacheMixin {
  final RegExp? emailRegExp;
  EmailValidation.pure({this.emailRegExp, String? value})
      : super.pure(value = '');

  EmailValidation.dirty({this.emailRegExp, String? value})
      : super.dirty(value = '');

  /// A default email [RegExp] which will be used if custom is not provided.
  static final _defaultEmailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else {
      if (emailRegExp != null) {
        if (!emailRegExp!.hasMatch(value)) {
          return EmailValidationError.invalid;
        }
      } else if (!_defaultEmailRegExp.hasMatch(value)) {
        return EmailValidationError.invalid;
      }
    }
    return null;
  }
}

extension EmailValidationExtension on EmailValidationError {
  /// Method that returns an error text whenever email validator is requesting it.
  String text({String? invalidText}) {
    switch (this) {
      case EmailValidationError.invalid:
        return invalidText ?? 'Please ensure the email entered is valid';
      case EmailValidationError.empty:
        return 'Please enter an email';
    }
  }
}
