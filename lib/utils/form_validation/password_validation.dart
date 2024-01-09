import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class PasswordValidation extends FormzInput<String, PasswordValidationError> {
  final RegExp? passwordRegExp;

  PasswordValidation.pure({this.passwordRegExp, String? value}) : super.pure(value = '');

  PasswordValidation.dirty({this.passwordRegExp, String? value}) : super.dirty(value = '');

  /// A default email [RegExp] which will be used if custom is not provided.
  static final _defaultPasswordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else {
      if (passwordRegExp != null) {
        if (!passwordRegExp!.hasMatch(value)) {
          return PasswordValidationError.invalid;
        }
      } else if (!_defaultPasswordRegExp.hasMatch(value)) {
        return PasswordValidationError.invalid;
      }
    }
    return null;
  }
}

extension PasswordValidationErrorExtension on PasswordValidationError {
  /// Method that returns an error text whenever email validator is requesting it.
  String text({String? invalidText}) {
    switch (this) {
      case PasswordValidationError.invalid:
        return invalidText ?? '''Password must be at least 8 characters and contain at least one letter and number''';
      case PasswordValidationError.empty:
        return 'Please enter a password';
    }
  }
}
