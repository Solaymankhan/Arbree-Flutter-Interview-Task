import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Utilities/Constants/strings.dart';

class emailAuthentication {
  Future<bool> signupUser(
      String email, String password, String name, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == weak_pass_txt) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(provded_pswrd_wk_txt)));
      } else if (e.code == email_alrdy_inuse_txt) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(email_alrdy_exst_txt)));
      }
      else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return false;
  }

  Future<bool> signinUser(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == usr_nt_fnd_txt) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(usr_nt_fnd_eml_txt)));
      } else if (e.code == rng_pswrd_txt) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(pswrd_dnt_mtch_txt)));
      }else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    }
    return false;
  }
}