import 'package:flutter/material.dart';
import 'package:project299/screens/login_screen.dart';
import 'package:project299/screens/message_page.dart';
import 'package:project299/screens/signup_screen.dart';
import 'package:project299/screens/welcome.dart';
import 'routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        focusColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: AppRoutes.welcome, // set the initial routes
      routes: {
        AppRoutes.welcome: (context) => const Welcome(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signup: (context) => const SignupScreen(),
        AppRoutes.messagePage: (context) => const MessagePage(),
      },
    );
  }
}
