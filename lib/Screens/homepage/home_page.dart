import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/Screens/admin.dart';
import 'package:firebasetask/Screens/login/components/auth_page.dart';
import 'package:firebasetask/Screens/manager.dart';
import 'package:firebasetask/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Editor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return AuthPage();
    },));
  }
  SignUpController signUpController = Get.put(SignUpController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("=>${signUpController.userType}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#fed8c3"),
      appBar: AppBar(
        title: Text("${signUpController.userType!}"),
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.login_outlined))
        ],
      ),
      body: signUpController.userType=="Manager"?manager():signUpController.userType=="Admin"?admin():Editor()
    );
  }
}


