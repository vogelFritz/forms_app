import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    return (isValid || isPure)
        ? null
        : (displayError == EmailError.empty)
            ? 'El campo es requerido'
            : (displayError == EmailError.format)
                ? 'No tiene formato de correo'
                : null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    return (value.isEmpty || value.trim().isEmpty)
        ? EmailError.empty
        : (!emailRegExp.hasMatch(value))
            ? EmailError.format
            : null;
  }
}
