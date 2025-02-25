import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project299/routes/app_routes.dart';
import '../components/action_btn.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(child: WelcomePart()),
    );
  }
}

class WelcomePart extends StatelessWidget {
  const WelcomePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          textAlign: TextAlign.center,
          "Welcome To The World Of No Spam",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SvgPicture.asset(
          'assets/welcomeSvg.svg',
          height: 300,
          width: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionBtn(
              btnText: "sign up",
              btnColor: Colors.red,
              onClick: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },
            ),
            ActionBtn(
              btnText: 'log in',
              btnColor: Colors.white,
              onClick: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              fontColor: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}

// /CupertinoColors.systemPink
