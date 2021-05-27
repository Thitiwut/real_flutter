import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:real_flutter/screens/authentication/phoneauth_screen.dart';
import 'package:real_flutter/screens/location_screen.dart';
import 'package:real_flutter/screens/login_screen.dart';
import 'package:real_flutter/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orangeAccent[700]),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
        LocationScreen.id: (context) => LocationScreen(),
      },
    );
  }
}
