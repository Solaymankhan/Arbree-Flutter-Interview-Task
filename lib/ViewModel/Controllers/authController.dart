import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/Network/Authentication/changePassword.dart';
import 'package:twitter_clone/Network/Authentication/emailLogin.dart';
import 'package:twitter_clone/Network/Authentication/signOutUser.dart';

import '../../Network/Authentication/googleLogin.dart';

class authController extends GetxController {
  RxString name = "".obs,
      email = "".obs,
      password = "".obs,
      dateOfBirth = "".obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginEmailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginPasswordFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // Validate Name
  String? validateName(String value) {
    name.value = value;
    if (value.length <= 3 || value.length >= 30) return "Enter valid Name";
    return null;
  }

  // Validate Email
  String? validateEmail(String value) {
    email.value = value;
    if (!GetUtils.isEmail(value) || value.isEmpty) return "Enter valid Email";
    return null;
  }

  // Validate Password
  String? validatePassword(String value) {
    password.value = value;
    if (value.length <= 6 || value.length >= 16) return "Enter valid Password";
    return null;
  }

  // Validate Date of Birth
  String? validateDob(String value) {
    dateOfBirth.value = value;
    if (!GetUtils.isDateTime(value)) return "Enter valid Date";
    return null;
  }

  Future<bool> googleLogin(context) async {
    return googleAuthentication().signInWithGoogle(context);
  }

  Future<bool> createAccount(context) async {
    return emailAuthentication()
        .signupUser(email.value, password.value, name.value, context);
  }
  Future<bool> emailLogin(context) async {
    return emailAuthentication()
        .signinUser(email.value, password.value,context);
  }
  Future<bool> forgotPassword(context) async {
    return changePassword().changeUserPassword(email.value, context);
  }
  Future<bool> logOutUser(context) async {
    return signOutUser().signoutUser(context);
  }
}
