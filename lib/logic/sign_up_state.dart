part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpCredentialsEmpty extends SignUpState {
  SignUpCredentialsEmpty(this._username, this._password, this._passwordConfirm);

  final String _username;
  final String _password;
  final String _passwordConfirm;

  String get username => _username;
  String get password => _password;
  String get passwordConfirm => _passwordConfirm;
}

class SignUpCredentialsUsernameEmpty extends SignUpState {
  // final String _username;
  //
  // SignUpCredentialsUsernameEmpty(this._username);
  //
  // String get username => _username;

}

class SignUpCredentialsNotEmpty extends SignUpState {
  // SignUpCredentialsNotEmpty(this._username, this._password, this._passwordConfirm);
  //
  // final String _username;
  // final String _password;
  // final String _passwordConfirm;
  //
  // String get username => _username;
  // String get password => _password;
  // String get passwordConfirm => _passwordConfirm;
}

class SignUpPasswordNotMatched extends SignUpState {}

class SignUpPasswordMatched extends SignUpState {}

class SignUpUsernameExceedMinMaxCharacters extends SignUpState {}

class SignUpUsernameValid extends SignUpState {}

class SignUpUsernameIsEntered extends SignUpState {}

class SignUpPasswordIsEntered extends SignUpState {}

class SignUpConfirmPasswordIsEntered extends SignUpState {}

class SignUpUsernameIsNotEntered extends SignUpState {}

class SignUpPasswordIsNotEntered extends SignUpState {}

class SignUpConfirmPasswordIsNotEntered extends SignUpState {}

// class SignUpExit extends SignUpState {}
