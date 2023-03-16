import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  String? _id;
  String? get id => _id;
  void setId(String? text) {
    _id = text;
    debugPrint("Updated id: $id");
    update();
  }
  String? _userType ="";
  String? get userType => _userType;
  void setUserType(String? text) {
    _userType = text;
    debugPrint("Updated userType: $userType");
    update();
  }

  String? _name;
  String? get name => _name;
  void setName(String? text) {
    _name = text;
    debugPrint("Updated name: $name");
    update();
  }

  String? _email;
  String? get email => _email;
  void setEmail(String? text) {
    _email = text;
    debugPrint("Updated email: $email");
    update();
  }

  String? _password;
  String? get password => _password;
  void setPassword(String? text) {
    _password = text;
    debugPrint("Updated password: $password");
    update();
  }

  String? _mobileNumber;
  String? get mobileNumber => _mobileNumber;
  void setMobileNumber(String? text) {
    _mobileNumber = text;
    debugPrint("Updated mobileNumber: $mobileNumber");
    update();
  }








}
