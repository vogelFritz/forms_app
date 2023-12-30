import 'package:formz/formz.dart';

enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');

  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    return (isValid || isPure)
        ? null
        : (displayError == PasswordError.empty)
            ? 'El campo es requerido'
            : (displayError == PasswordError.length)
                ? 'Debe tener al menos 6 caracteres'
                : null;
  }

  @override
  PasswordError? validator(String value) {
    return (value.isEmpty || value.trim().isEmpty)
        ? PasswordError.empty
        : (value.length < 6)
            ? PasswordError.length
            : null;
  }
}
