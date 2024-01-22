import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    bool success = true;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      print(e);
      success = false;
    }

    return success;
  }
}
