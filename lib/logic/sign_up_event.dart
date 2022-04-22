part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpCredentialsEnteredEvent extends SignUpEvent {
  // final String _username;
  // final String _password;
  // final String _confirmPassword;
  //
  // SignUpCredentialsEnteredEvent(
  //     this._username, this._password, this._confirmPassword);
  //
  // String get username => _username;
  // String get password => _password;
  // String get confirmPassword => _confirmPassword;
}

class SignUpCredentialsNotEnteredEvent extends SignUpEvent {
  // final String _username;
  // final String _password;
  // final String _confirmPassword;
  //
  // SignUpCredentialsNotEnteredEvent(
  //     this._username, this._password, this._confirmPassword);
  //
  // String get username => _username;
  // String get password => _password;
  // String get confirmPassword => _confirmPassword;
}

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

class SignUpPasswordEnteredNotMatchedEvent extends SignUpEvent {}

class SignUpPasswordEnteredMatchedEvent extends SignUpEvent {}

