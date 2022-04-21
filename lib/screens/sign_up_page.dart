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
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);
    _username.addListener(checkControllerEntered);
    _password.addListener(checkControllerEntered);
    _confirmPassword.addListener(checkControllerEntered);
    // _signUpBloc.addEvents(_username, _password, _confirmPassword);
    super.initState();
  }

  void checkControllerEntered() {
    setState(() {
      if (_username.text.isNotEmpty &&
          _password.text.isNotEmpty &&
          _confirmPassword.text.isNotEmpty) {
        _signUpBloc.add(SignUpCredentialsEnteredEvent());
        if (_password.text != _confirmPassword.text) {
          _signUpBloc.add(SignUpPasswordEnteredNotMatched());
        }
        _signUpBloc.add(SignUpPasswordEnteredMatched());
        _isButtonDisabled = false;
      } else {
        _signUpBloc.add(SignUpCredentialsNotEnteredEvent());
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
            // TODO: implement listener
            if (state is SignUpCredentialsNotEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Entered")));
              print("All entered");
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
                    'Username'),
                buildTextField(
                  _password,
                  true,
                  Icon(
                    IconData(0xe47a, fontFamily: 'MaterialIcons'),
                  ),
                  'Password',
                ),
                buildTextField(
                    _confirmPassword,
                    true,
                    Icon(
                      IconData(0xe47a, fontFamily: 'MaterialIcons'),
                    ),
                    'Confirm your password'),
                buildTextButton(() {
                  if (state is SignUpCredentialsNotEmpty) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Entered")));
                    print("Enter");
                  }
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
      Icon icon, String labelText) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        border: UnderlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
