import 'package:flutter/material.dart';

import 'package:real_flutter/screens/authentication/phoneauth_screen.dart';

class AuthUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 220,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, PhoneAuthScreen.id);
              },
              child: Row(
                children: [
                  Icon(Icons.phone_android_outlined, color: Colors.black),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Continue with phone',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )),
        ),
        // SignInButton(
        //   Buttons.Google,
        //   text: "Sign up with Google",
        //   onPressed: () {},
        // ),
        // SignInButton(
        //   Buttons.FacebookNew,
        //   text: "Sign up with Facebook",
        //   onPressed: () {},
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     'OR',
        //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     'Login withe email',
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //         decoration: TextDecoration.underline),
        //   ),
        // )
      ],
    ));
  }
}
