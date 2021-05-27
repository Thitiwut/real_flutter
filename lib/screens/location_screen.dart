import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_flutter/screens/login_screen.dart';

class LocationScreen extends StatelessWidget {
  static const id = 'location-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Image.asset(
          'assets/images/hospital.jpg',
          width: 250,
          height: 200,
        ),
        SizedBox(
          height: 20,
        ),
        Text('Helth Me',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.deepOrange)),
        SizedBox(
          height: 20,
        ),
        Text('ยินดีต้อนรับ',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            child: Text('ออกจากระบบ'),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushReplacementNamed(context, LoginScreen.id);
              });
            },
          ),
        ),
      ]),
    );
  }
}
