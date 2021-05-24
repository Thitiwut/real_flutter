import 'package:flutter/material.dart';
import 'package:real_flutter/widgets/auth_ui.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/images/logo.png',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Health Me',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan.shade900),
                )
              ],
            ),
          )),
          Expanded(
            child: Container(
              child: AuthUi(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'if you continue, your are acceptiong\n terms and condition and privacy',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}