

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Utilities/Constants/strings.dart';

class changePassword{
  Future<bool> changeUserPassword(email,context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(try_agn_txt)));
      return false;
    }
  }
}