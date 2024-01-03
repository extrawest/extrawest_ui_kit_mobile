import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class PasswordValidation extends FormzInput<String, PasswordValidationError> {
  const PasswordValidation.pure([super.value = '']) : super.pure();

  const PasswordValidation.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (!_passwordRegex.hasMatch(value)) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}

extension PasswordValidationErrorExtension on PasswordValidationError {
  String text() {
    switch (this) {
      case PasswordValidationError.invalid:
        return '''Password must be at least 8 characters and contain at least one letter and number''';
      case PasswordValidationError.empty:
        return 'Please enter a password';
    }
  }
}
