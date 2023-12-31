import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    return (isValid || isPure)
        ? null
        : (displayError == UsernameError.empty)
            ? 'El campo es requerido'
            : (displayError == UsernameError.length)
                ? 'Debe tener al menos 6 caracteres'
                : null;
  }

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    return (value.isEmpty || value.trim().isEmpty)
        ? UsernameError.empty
        : (value.length < 6)
            ? UsernameError.length
            : null;
  }
}
