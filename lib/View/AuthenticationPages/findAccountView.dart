import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/View/AuthenticationPages/enterNewPasswordView.dart';
import 'package:twitter_clone/View/AuthenticationPages/welcomePageView.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utilities/Components/button.dart';
import '../../Utilities/Components/circleIconButton.dart';
import '../../Utilities/Components/textField.dart';
import '../../Utilities/Constants/colors.dart';
import '../../Utilities/Constants/imagePathes.dart';
import '../../Utilities/Constants/strings.dart';
import '../../ViewModel/Functions/HexColor.dart';

class findAccountView extends StatelessWidget {
  const findAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: circleIconButton(
                btn_clr: Colors.transparent, icon: Icons.close, onTap: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => welcomePageView(),
                ),
                    (route) => false,//if you want to disable back feature set to false
              );
            }),
            title: SvgPicture.asset(
              twitter_icn,
              height: 30,
              width: 30,
            ).centered().marginOnly(right: 55)),
        body: SafeArea(
            child: Column(children:  [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          30.heightBox,
                          Text(enter_email_txt,
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          30.heightBox,
                          textField(
                              labelTxt:email_txt,
                              obscureText: false,
                              prefixIcon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
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
                          30.heightBox,
                        ],
                      )),
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
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => enterNewPasswordView()));
                        }),
                  )
                ],),
              20.heightBox
            ]).marginOnly(left: 25, right: 25)));
  }
}
