import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebasetask/screens/homepage/home_page.dart';
import 'package:firebasetask/screens/login/login.dart';

class AuthPage extends StatefulWidget {



  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){

      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        },));
      }
      else
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        },));
      }

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
