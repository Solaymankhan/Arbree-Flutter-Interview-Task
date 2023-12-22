import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/Utilities/Components/button.dart';
import 'package:twitter_clone/Utilities/Constants/colors.dart';
import 'package:twitter_clone/Utilities/Constants/strings.dart';
import 'package:twitter_clone/View/AuthenticationPages/enterPasswordView.dart';
import 'package:twitter_clone/View/AuthenticationPages/setPasswordView.dart';
import 'package:twitter_clone/View/homeView.dart';
import 'package:twitter_clone/ViewModel/Controllers/authController.dart';
import 'package:twitter_clone/ViewModel/Functions/HexColor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utilities/Components/textField.dart';
import '../../Utilities/Constants/imagePathes.dart';

class createAccountView extends StatelessWidget {
  createAccountView({Key? key}) : super(key: key);
  final authController createAccountControl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SvgPicture.asset(
        twitter_icn,
        height: 30,
        width: 30,
      ).centered().marginOnly(right: 55)),
      body: SafeArea(
          child: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: createAccountControl.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.heightBox,
                  Text(
                    create_acnt_txt,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  30.heightBox,
                  textField(
                      labelTxt: name_txt,
                      obscureText: false,
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.text,
                      validator:(value)=>createAccountControl.validateName(value!)),
                  20.heightBox,
                  textField(
                      labelTxt: email_txt,
                      obscureText: false,
                      prefixIcon: Icons.mail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value)=>createAccountControl.validateEmail(value!)),
                  15.heightBox,
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 90,
              height: 35,
              child: button(
                  btn_clr: HexColor(twitter_color),
                  txt: next_txt,
                  txt_clr: Colors.white,
                  onTap: () {
                    if (createAccountControl.formKey.currentState!.validate()){
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => setPasswordView()));
                          }
                  }),
            )
          ],
        ),
        20.heightBox
      ]).marginOnly(left: 25, right: 25)),
    );
  }
}
