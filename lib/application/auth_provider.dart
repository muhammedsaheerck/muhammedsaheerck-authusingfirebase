import 'dart:developer';

import 'package:authusingfire/infrastructure/auth.dart';
import 'package:authusingfire/presentation/home.dart';
import 'package:authusingfire/presentation/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthProvider extends ChangeNotifier {
  String? errorMessage = '';

  bool isLogin = true;
  Future<void> signInWithemail(String email, String password, context) async {
    try {
      await AuthFire().signIn(email: email, password: password);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ScreenHome()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;

      log(e.code.toString());
    }
    notifyListeners();
  }

  Future<void> signUPWithemail(String email, String password, context) async {
    try {
      await AuthFire().createUser(email: email, password: password);
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    }
    notifyListeners();
  }

  void loginOrSignUp(bool value) {
    isLogin = value;
    notifyListeners();
  }

  Future<void> signOut(context) async {
    try {
      await AuthFire().signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenLogin()));
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    }
  }
}
