import 'package:Gift_Erbil/admin/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:Gift_Erbil/screens/auth_screen.dart';

class AdminLoginMedium extends StatefulWidget {
  @override
  _AdminLoginMediumState createState() => _AdminLoginMediumState();
}

class _AdminLoginMediumState extends State<AdminLoginMedium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => AdminScreen()),
              //         (route) => false);
              return AdminScreen();
            } else {
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => AuthScreen()),
              //         (route) => false);
              return AuthScreen();
            }
          }),
    );
  }
}
