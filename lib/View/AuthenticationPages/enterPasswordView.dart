

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/View/AuthenticationPages/welcomePageView.dart';
import 'package:twitter_clone/ViewModel/Controllers/authController.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utilities/Components/button.dart';
import '../../Utilities/Components/circleIconButton.dart';
import '../../Utilities/Components/textField.dart';
import '../../Utilities/Constants/colors.dart';
import '../../Utilities/Constants/imagePathes.dart';
import '../../Utilities/Constants/strings.dart';
import '../../ViewModel/Functions/HexColor.dart';
import '../homeView.dart';

class enterPasswordView extends StatelessWidget {
  enterPasswordView({Key? key}) : super(key: key);

  final authController authControl = Get.find();

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
                (route) => false,
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
                    key: authControl.loginPasswordFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          30.heightBox,
                          Text(enter_password_txt,
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          30.heightBox,
                          textField(
                              labelTxt:password_txt,
                              obscureText: true,
                              prefixIcon: Icons.lock,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value)=>authControl.validatePassword(value!)),
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
                        txt: login_txt,
                        txt_clr: Colors.white,
                        onTap: () async{
                          if(authControl.loginPasswordFormKey.currentState!.validate())
                            {
                              if(await authControl.emailLogin(context)==true){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => homeView(),
                                  ),
                                      (route) => false,
                                );
                              }
                            }
                        }),
                  )
                ],),
              20.heightBox
            ]).marginOnly(left: 25, right: 25)));
  }
}
