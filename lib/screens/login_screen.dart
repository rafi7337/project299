import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project299/components/action_btn.dart';
import 'package:project299/routes/app_routes.dart';

import '../components/input_btn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Log In",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/profile.png'),
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(
              height: 50,
            ),
            InputBtn(
              emailController: _emailController,
              focusNode: _emailFocusNode,
              inputHintText: "Enter your email address",
              inputLabelText: "Email",
              prefixLabelIcon: Icons.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            InputBtn(
              emailController: _passwordController,
              focusNode: _passFocusNode,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",style: TextStyle(color: Colors.grey,),),
                SizedBox(width: 5,),
                TextButton(
                  onPressed: () {
                    // Your action here
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },

                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // No padding
                    foregroundColor: null, // No text color change
                  ),
                  child: Text('Sign up'),
                ),
              ],

            ),
            SizedBox(
              height: 50,
            ),
            ActionBtn(
                flexValue: 0,
                btnText: 'log in',
                btnColor: Colors.greenAccent,
                onClick: () {
                  Navigator.pushNamed(context, AppRoutes.messagePage);
                }),
          ],
        ),
      ),
    );
  }
}
