import 'package:bloc_sign_up_page/logic/sign_up_bloc.dart';
import 'package:bloc_sign_up_page/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(),
      child: MaterialApp(
        home: SignUpPage(),
      ),
    );
  }
}
