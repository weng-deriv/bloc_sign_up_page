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
    on<SignUpPasswordEnteredNotMatchedEvent>(_signUpPasswordEnteredNotMatched);
    on<SignUpPasswordEnteredMatchedEvent>(_signUpPasswordEnteredMatched);
    on<SignUpCredentialsCheckEnteredUsernameEvent>(
        _signUpCredentialsCheckEnteredUsername);
  }

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
    } else {
      emit(SignUpUsernameValid());
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

  void _signUpPasswordEnteredNotMatched(
      SignUpPasswordEnteredNotMatchedEvent event, Emitter<SignUpState> emit) {
    emit(SignUpPasswordNotMatched());
  }

  void _signUpPasswordEnteredMatched(
      SignUpPasswordEnteredMatchedEvent event, Emitter<SignUpState> emit) {
    emit(SignUpPasswordMatched());
  }
}
