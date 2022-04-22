import 'dart:ffi';

import 'package:bloc_sign_up_page/logic/sign_up_bloc.dart';
import 'package:bloc_sign_up_page/screens/second_page.dart';
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

  void onPress(state, context) {
    if (state is SignUpUsernameValid &&
        state is SignUpPasswordValid &&
        state is SignUpPasswordsMatched) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SecondPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Something is not right!!!'),
      ));
    }
  }

  String? getUsernameErrorText(state) {
    if (_username.text.isEmpty) {
      // print(state.toString());
      return "Please enter your username";
    }
    print(state.toString());
    if (state is SignUpUsernameExceedMinMaxCharacters) {
      return "Make sure that your username is between 3 to 8\ncharacters !!!";
    }
    if (state is SignUpUsernameContainsSpecialCharacters) {
      return "Make sure no special characters in your \nusername";
    }

    return null;
  }

  String? getPasswordErrorText(state) {
    if (_password.text.isEmpty) {
      return "Please enter your password";
    }
    if (state is SignUpPasswordExceedMinMaxCharacters) {
      return "Make sure that your password is between 8 \nto 24 characters";
    }
    if (state is SignUpPasswordAtLeastContainsOneSpecialCharacters) {
      return "Make sure to have at least one uppercase \ncharacter, one lower case character, one \ndigit, one special characters and 8 characters in length!!!";
    }
    return null;
  }

  String? getConfirmPasswordErrorText(state) {
    if (_confirmPassword.text.isEmpty) {
      return "Please confirm your password!!!";
    }
    if (state is SignUpPasswordsNotMatched) {
      return "Please make sure you've matched the \npassword you filled in";
    }
    return null;
  }

  void checkControllerEntered() {
    setState(() {
      if (_username.text.isEmpty) {
        _signUpBloc.add(SignUpCredentialsUsernameNotEnteredEvent());
      } else if (_username.text.isNotEmpty) {
        _signUpBloc.add(SignUpCredentialsUsernameEnteredEvent());
      }

      if (_password.text.isEmpty) {
        _signUpBloc.add(SignUpCredentialsPasswordNotEnteredEvent());
      } else if (_password.text.isNotEmpty) {
        _signUpBloc.add(SignUpCredentialsPasswordEnteredEvent());
      }

      if (_confirmPassword.text.isEmpty) {
        _signUpBloc.add(SignUpCredentialsConfirmPasswordNotEnteredEvent());
      } else if (_confirmPassword.text.isNotEmpty) {
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

            if (state is SignUpPasswordIsEntered) {
              _signUpBloc.add(
                  SignUpCredentialsCheckedEnteredPasswordEvent(_password.text));
            }

            if (state is SignUpConfirmPasswordIsEntered) {
              _signUpBloc.add(
                  SignUpCredentialsCheckedEnteredConfirmPasswordEvent(
                      _confirmPassword.text, _password.text));
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
                  getConfirmPasswordErrorText(state),
                  'Please confirm your password.',
                ),
                SizedBox(height: 10),
                buildTextButton(() {
                  onPress(state, context);
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
