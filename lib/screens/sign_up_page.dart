import 'dart:ffi';

import 'package:bloc_sign_up_page/logic/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isButtonDisabled = true;
  late final SignUpBloc _signUpBloc;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _username.addListener(checkControllerEntered);
    _password.addListener(checkControllerEntered);
    _confirmPassword.addListener(checkControllerEntered);
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);
  }

  String? getUsernameErrorText(state) {
    if (state is SignUpUsernameIsNotEntered) {
      // print(state.toString());
      return "Please enter your username";
    }
    print(state.toString());
    if (state is SignUpUsernameExceedMinMaxCharacters) {
      return "Make sure that your username is between 3 to 8\ncharacters !!!";
    }

    return null;
  }

  String? getPasswordErrorText(state) {
    if (state is SignUpPasswordIsNotEntered) {
      return "Please enter your password";
    }
    return null;
  }

  void checkControllerEntered() {
    setState(() {
      if (_username.text.isEmpty) {
        _signUpBloc.add(SignUpCredentialsUsernameNotEnteredEvent());
      }

      if (_username.text.isNotEmpty) {
        _signUpBloc.add(SignUpCredentialsUsernameEnteredEvent());
      }

      if (_password.text.isEmpty) {
        _signUpBloc.add(SignUpCredentialsPasswordNotEnteredEvent());
      }

      if (_password.text.isNotEmpty) {
        _signUpBloc.add(SignUpCredentialsPasswordEnteredEvent());
      }

      if (_confirmPassword.text.isEmpty) {
        _signUpBloc.add(SignUpCredentialsConfirmPasswordNotEnteredEvent());
      }

      if (_confirmPassword.text.isNotEmpty) {
        _signUpBloc.add(SignUpCredentialsConfirmPasswordEnteredEvent());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _username.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sign Up")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpUsernameIsEntered) {
              _signUpBloc.add(
                  SignUpCredentialsCheckEnteredUsernameEvent(_username.text));
            }
            if (state is SignUpUsernameIsNotEntered) {
              _signUpBloc.add(SignUpCredentialsUsernameNotEnteredEvent());
            }
            if(state is SignUpPasswordIsEntered){
              _signUpBloc.add(SignUpCredentialsPasswordEnteredEvent());
            }
            if(state is SignUpPasswordIsNotEntered){
              _signUpBloc.add(SignUpCredentialsPasswordNotEnteredEvent());
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextField(
                  _username,
                  false,
                  Icon(
                    IconData(0xe491, fontFamily: 'MaterialIcons'),
                  ),
                  'Username',
                  getUsernameErrorText(state),
                  'Please enter your username!',
                ),
                buildTextField(
                  _password,
                  true,
                  Icon(
                    IconData(0xe47a, fontFamily: 'MaterialIcons'),
                  ),
                  'Password',
                  getPasswordErrorText(state),
                  'Please enter your password.',
                ),
                buildTextField(
                  _confirmPassword,
                  true,
                  Icon(
                    IconData(0xe47a, fontFamily: 'MaterialIcons'),
                  ),
                  'Confirm your password',
                  // getPasswordErrorText(state)
                  "Hello",
                  'Please confirm your password.',
                ),
                SizedBox(height: 10),
                buildTextButton(() {
                  // if (state is SignUpCredentialsNotEmpty) {
                  //   ScaffoldMessenger.of(context)
                  //       .showSnackBar(SnackBar(content: Text("Entered")));
                  //   print("Enter");
                  // }
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  TextButton buildTextButton(VoidCallback onPress) {
    return TextButton(
      onPressed: onPress,
      child: Text('Sign Up'),
    );
  }

  TextField buildTextField(TextEditingController controller, bool obscureText,
      Icon icon, String labelText, String? errorText, String hintText) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        border: UnderlineInputBorder(),
        labelText: labelText,
        errorText: errorText,
        hintText: hintText,
      ),
    );
  }
}
