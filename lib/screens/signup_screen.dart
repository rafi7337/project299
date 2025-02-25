import 'package:flutter/material.dart';
import 'package:project299/components/input_btn.dart';

import '../components/action_btn.dart';
import '../routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _lastFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/profile.png'),
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(
                height: 20,
              ),
              InputBtn(
                emailController: _emailController,
                prefixLabelIcon: Icons.email,
                inputLabelText: 'Email',
                inputHintText: 'Enter mail',
                isPasswordField: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                focusNode: _emailFocusNode,
              ),
              SizedBox(
                height: 20,
              ),
              InputBtn(
                emailController: _firstController,
                prefixLabelIcon: Icons.person,
                inputLabelText: 'First',
                inputHintText: 'Enter first name',
                isPasswordField: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                focusNode: _firstFocusNode,
              ),
              SizedBox(
                height: 20,
              ),
              InputBtn(
                emailController: _lastController,
                prefixLabelIcon: Icons.person_2,
                inputLabelText: 'Last',
                inputHintText: 'Enter last name',
                isPasswordField: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                focusNode: _lastFocusNode,
              ),
              SizedBox(
                height: 20,
              ),
              InputBtn(
                emailController: _passController,
                focusNode: _passwordFocusNode,
                inputHintText: "Enter your password",
                inputLabelText: "Password",
                prefixLabelIcon: Icons.lock,
                isPasswordField: true, // Set this to true for password fields
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              InputBtn(
                emailController: _confirmController,
                focusNode: _confirmFocusNode,
                inputHintText: "Confirm password",
                inputLabelText: "Confirm Password",
                prefixLabelIcon: Icons.lock,
                isPasswordField: true, // Set this to true for password fields
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  TextButton(
                    onPressed: () {
                      // Your action here
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // No padding
                      foregroundColor: null, // No text color change
                    ),
                    child: Text('Sign in'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ActionBtn(
                  flexValue: 0,
                  btnText: 'Sign up',
                  btnColor: Colors.red,
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
