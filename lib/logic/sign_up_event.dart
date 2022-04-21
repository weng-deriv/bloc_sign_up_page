part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpCredentialsEnteredEvent extends SignUpEvent {
  // SignUpCredentialsEntered(
  //     this._username, this._password, this._confirmPassword);
  //
  // final String _username;
  // final String _password;
  // final String _confirmPassword;
  //
  // String get username => _username;
  // String get password => _password;
  // String get confirmPassword => _confirmPassword;
}

class SignUpCredentialsNotEnteredEvent extends SignUpEvent {}

class SignUpPasswordEnteredNotMatched extends SignUpEvent {}

class SignUpPasswordEnteredMatched extends SignUpEvent {}

// class SignUpExit extends SignUpEvent {}
