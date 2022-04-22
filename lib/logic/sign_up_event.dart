part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpCredentialsEnteredEvent extends SignUpEvent {}

class SignUpCredentialsNotEnteredEvent extends SignUpEvent {}

class SignUpCredentialsUsernameEnteredEvent extends SignUpEvent {}

class SignUpCredentialsPasswordEnteredEvent extends SignUpEvent {}

class SignUpCredentialsConfirmPasswordEnteredEvent extends SignUpEvent {}

class SignUpCredentialsUsernameNotEnteredEvent extends SignUpEvent {}

class SignUpCredentialsPasswordNotEnteredEvent extends SignUpEvent {}

class SignUpCredentialsConfirmPasswordNotEnteredEvent extends SignUpEvent {}

class SignUpCredentialsCheckEnteredUsernameEvent extends SignUpEvent {
  final String _username;

  SignUpCredentialsCheckEnteredUsernameEvent(this._username);

  String get username => _username;
}

class SignUpCredentialsCheckedEnteredPasswordEvent extends SignUpEvent {
  final String _password;

  SignUpCredentialsCheckedEnteredPasswordEvent(this._password);

  String get password => _password;
}

class SignUpCredentialsCheckedEnteredConfirmPasswordEvent extends SignUpEvent {
  final String _confirmPassword;
  final String _password;

  SignUpCredentialsCheckedEnteredConfirmPasswordEvent(
      this._confirmPassword, this._password);

  String get confirmPassword => _confirmPassword;
  String get password => _password;
}
