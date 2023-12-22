import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signOutUser {
  Future<bool> signoutUser(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }
}
