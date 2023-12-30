part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating, posting }

class RegisterFormState extends Equatable {
  final Username username;
  final Email email;
  final bool isValid;
  final Password password;
  final FormStatus formStatus;
  const RegisterFormState(
      {this.username = const Username.pure(),
      this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.formStatus = FormStatus.invalid});

  RegisterFormState copyWith(
          {Username? username,
          Email? email,
          bool? isValid,
          Password? password,
          FormStatus? formStatus}) =>
      RegisterFormState(
          username: username ?? this.username,
          email: email ?? this.email,
          isValid: isValid ?? this.isValid,
          password: password ?? this.password,
          formStatus: formStatus ?? this.formStatus);

  @override
  List<Object> get props => [username, email, isValid, password, formStatus];
}
