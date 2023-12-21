

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleAuthentication{

  Future<bool> signInWithGoogle(context) async{
    try{
      final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth= await gUser!.authentication;
      final credential= GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }
  Future<bool> signOutWithGoogle(context) async{
    try{
      await FirebaseAuth.instance.signOut();
      return true;
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }
}