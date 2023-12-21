import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/Utilities/Components/button.dart';
import 'package:twitter_clone/Utilities/Constants/colors.dart';
import 'package:twitter_clone/Utilities/Constants/strings.dart';
import 'package:twitter_clone/ViewModel/Functions/HexColor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utilities/Components/textField.dart';
import '../../Utilities/Constants/imagePathes.dart';

class createAccountView extends StatelessWidget {
  const createAccountView({Key? key}) : super(key: key);

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
                    labelTxt:name_txt,
                    obscureText: false,
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      /*fullname = value!;*/
                    },
                    validator: (value) {
                      /* if (value!.isEmpty) {
                                  return valid_name_txt;
                                } else {
                                  return null;
                                }*/
                    }),
                20.heightBox,
                textField(
                    labelTxt: email_txt,
                    obscureText: false,
                    prefixIcon: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      /* email = value!;*/
                    },
                    validator: (value) {
                      /* if (value!.isEmpty || !value.contains('@')) {
                                  return valid_email_txt;
                                } else {
                                  return null;
                                }*/
                    }),
                20.heightBox,
                textField(
                    labelTxt: date_of_birth_txt,
                    obscureText: false,
                    prefixIcon: Icons.timer,
                    keyboardType: TextInputType.datetime,
                    onSaved: (value) {
                      /* password = value!;*/
                    },
                    validator: (value) {
                      /* if (value!.isEmpty ||
                                    value.length < 6 ||
                                    value.length > 10) {
                                  return valid_password_txt;
                                } else {
                                  return null;
                                }*/
                    }),
                15.heightBox,
              ],
            )),
          ),
        ),
        button(
            btn_clr: HexColor(twitter_color),
            txt: next_txt,
            txt_clr: Colors.white,
            onTap: () {}),
            20.heightBox
      ]).marginOnly(left: 25, right: 25)),
    );
  }
}
