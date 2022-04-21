part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpCredentialsEmpty extends SignUpState {
  // SignUpCredentialsEmpty(this._username, this._password, this._passwordConfirm);
  //
  // final String _username;
  // final String _password;
  // final String _passwordConfirm;
}

class SignUpCredentialsNotEmpty extends SignUpState {}

class SignUpPasswordNotMatched extends SignUpState {}

class SignUpPasswordMatched extends SignUpState {}

// class SignUpExit extends SignUpState {}
