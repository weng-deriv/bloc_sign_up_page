import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    // on<SignUpCredentialsEnteredEvent>(_signUpCredentialsEntered);
    // on<SignUpCredentialsNotEnteredEvent>(_signUpCredentialsNotEntered);
    on<SignUpCredentialsUsernameNotEnteredEvent>(
        _signUpCredentialsUsernameNotEntered);
    on<SignUpCredentialsPasswordNotEnteredEvent>(
        _signUpCredentialsPasswordNotEntered);
    on<SignUpCredentialsConfirmPasswordNotEnteredEvent>(
        _signUpCredentialConfirmPasswordNotEntered);
    on<SignUpCredentialsUsernameEnteredEvent>(
        _signUpCredentialsUsernameEntered);
    on<SignUpCredentialsPasswordEnteredEvent>(
        _signUpCredentialsPasswordEntered);
    on<SignUpCredentialsConfirmPasswordEnteredEvent>(
        _signUpCredentialsConfirmPasswordEntered);
    on<SignUpCredentialsCheckEnteredUsernameEvent>(
        _signUpCredentialsCheckEnteredUsername);
    on<SignUpCredentialsCheckedEnteredPasswordEvent>(
        _signUpCredentialsCheckEnteredPassword);
    on<SignUpCredentialsCheckedEnteredConfirmPasswordEvent>(
        _signUpCredentialsCheckedEnteredConfirmPassword);
  }

  static RegExp regExp = RegExp("[^A-Za-z0-9]");
  static RegExp passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  void _signUpCredentialsEntered(
      SignUpCredentialsEnteredEvent event, Emitter<SignUpState> emit) {
    emit(SignUpCredentialsNotEmpty());
  }

  void _signUpCredentialsCheckEnteredUsername(
      SignUpCredentialsCheckEnteredUsernameEvent event,
      Emitter<SignUpState> emit) {
    // // if(event.username.lengt{
    // //   print('derivvvvvvvv');
    // // }
    // // print(event.username.length);
    // if (event.username.isEmpty) {
    //   emit(SignUpCredentialsUsernameEmpty());
    // }
    if (event.username.length <= 2 || event.username.length > 8) {
      emit(SignUpUsernameExceedMinMaxCharacters());
    } else if (regExp.hasMatch(event.username)) {
      emit(SignUpUsernameContainsSpecialCharacters());
    } else {
      emit(SignUpUsernameValid());
    }
  }

  void _signUpCredentialsCheckEnteredPassword(
      SignUpCredentialsCheckedEnteredPasswordEvent event,
      Emitter<SignUpState> emit) {
    if (!passwordRegExp.hasMatch(event.password)) {
      emit(SignUpPasswordAtLeastContainsOneSpecialCharacters());
    } else {
      emit(SignUpPasswordValid());
    }
  }

  void _signUpCredentialsCheckedEnteredConfirmPassword(
      SignUpCredentialsCheckedEnteredConfirmPasswordEvent event,
      Emitter<SignUpState> emit) {
    if (event.confirmPassword != event.password) {
      emit(SignUpPasswordsNotMatched());
    } else {
      emit(SignUpPasswordsMatched());
    }
  }

  void _signUpCredentialsUsernameEntered(
      SignUpCredentialsUsernameEnteredEvent event, Emitter<SignUpState> emit) {
    emit(SignUpUsernameIsEntered());
  }

  void _signUpCredentialsPasswordEntered(
      SignUpCredentialsPasswordEnteredEvent event, Emitter<SignUpState> emit) {
    emit(SignUpPasswordIsEntered());
  }

  void _signUpCredentialsConfirmPasswordEntered(
      SignUpCredentialsConfirmPasswordEnteredEvent event,
      Emitter<SignUpState> emit) {
    emit(SignUpConfirmPasswordIsEntered());
  }

  void _signUpCredentialsUsernameNotEntered(
      SignUpCredentialsUsernameNotEnteredEvent event,
      Emitter<SignUpState> emit) {
    emit(SignUpUsernameIsNotEntered());
  }

  void _signUpCredentialsPasswordNotEntered(
      SignUpCredentialsPasswordNotEnteredEvent event,
      Emitter<SignUpState> emit) {
    emit(SignUpPasswordIsNotEntered());
  }

  void _signUpCredentialConfirmPasswordNotEntered(
      SignUpCredentialsConfirmPasswordNotEnteredEvent event,
      Emitter<SignUpState> emit) {
    emit(SignUpConfirmPasswordIsNotEntered());
  }
}
