import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpCredentialsEnteredEvent>(_signUpCredentialsEntered);
    on<SignUpCredentialsNotEnteredEvent>(_signUpCredentialsNotEntered);
    on<SignUpPasswordEnteredNotMatched>(_signUpPasswordEnteredNotMatched);
    on<SignUpPasswordEnteredMatched>(_signUpPasswordEnteredMatched);
  }

  // void addEvents(TextEditingController username, TextEditingController password,
  //     TextEditingController confirmPassword) {
  //   if (username.text.isNotEmpty &&
  //       password.text.isNotEmpty &&
  //       confirmPassword.text.isNotEmpty) {
  //     // add(SignUpCredentialsEntered(
  //     //     username.text, password.text, confirmPassword.text));
  //     add(SignUpCredentialsEnteredEvent());
  //
  //     if (password != confirmPassword) {
  //       add(SignUpPasswordEnteredNotMatched());
  //     } else {
  //       add(SignUpPasswordEnteredMatched());
  //     }
  //   } else {
  //     add(SignUpCredentialsNotEnteredEvent());
  //   }
  // }

  void _signUpCredentialsEntered(SignUpEvent event, Emitter<SignUpState> emit) {
    emit(SignUpCredentialsNotEmpty());
  }

  void _signUpCredentialsNotEntered(
      SignUpEvent event, Emitter<SignUpState> emit) {
    emit(SignUpCredentialsEmpty());
  }

  void _signUpPasswordEnteredNotMatched(
      SignUpEvent event, Emitter<SignUpState> emit) {
    emit(SignUpPasswordNotMatched());
  }

  void _signUpPasswordEnteredMatched(
      SignUpEvent event, Emitter<SignUpState> emit) {
    emit(SignUpPasswordMatched());
  }
}
