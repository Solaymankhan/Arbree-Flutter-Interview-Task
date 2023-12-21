import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/Network/Authentication/googleLogin.dart';
import 'package:twitter_clone/Utilities/Components/button.dart';
import 'package:twitter_clone/Utilities/Components/textButton.dart';
import 'package:twitter_clone/Utilities/Constants/colors.dart';
import 'package:twitter_clone/Utilities/Constants/imagePathes.dart';
import 'package:twitter_clone/Utilities/Constants/strings.dart';
import 'package:twitter_clone/View/homeView.dart';
import 'package:twitter_clone/ViewModel/Functions/HexColor.dart';
import 'package:velocity_x/velocity_x.dart';

import 'createAccountView.dart';
import 'logInView.dart';

class welcomePageView extends StatelessWidget {
  const welcomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: SvgPicture.asset(
          twitter_icn,
          height: 30,
          width: 30,
        ).centered()),
        body: SafeArea(
            child: Column(children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  see_what_happening_txt,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          // Google Sign-In Button
          Column(children: [
            button(
                btn_clr: Colors.transparent,
                icon: google_icn,
                txt: continue_ggle_txt,
                onTap: () async {
                  if (await googleAuthentication().signInWithGoogle(context) ==
                      true) {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => homeView()));
                  }
                }),

            // Or Line
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Vx.gray400,
                  ),
                ),
                Text(
                  or_txt,
                  style: TextStyle(color: Vx.gray600, fontSize: 12),
                ).paddingAll(8),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Vx.gray400,
                  ),
                ),
              ],
            ),

            // Create Account Button
            button(
                btn_clr: HexColor(twitter_color),
                txt: create_account_txt,
                txt_clr: Colors.white,
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => createAccountView()));
                }),
            30.heightBox,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: by_signup_txt,
                    style: TextStyle(color: Vx.gray600, fontSize: 13),
                  ),
                  WidgetSpan(
                    child: txtButton(
                        txt: terms_txt,
                        txtColor: HexColor(twitter_color),
                        fontSize: 13.0,
                        onTap: () {}),
                  ),
                  TextSpan(
                    text: ',',
                    style: TextStyle(
                      color: Vx.gray600,
                      fontSize: 13,
                    ),
                  ),
                  WidgetSpan(
                    child: txtButton(
                        txt: policy_txt,
                        txtColor: HexColor(twitter_color),
                        fontSize: 13.0,
                        onTap: () {}),
                  ),
                  TextSpan(
                    text: and_txt,
                    style: TextStyle(
                      color: Vx.gray600,
                      fontSize: 13,
                    ),
                  ),
                  WidgetSpan(
                    child: txtButton(
                        txt: cookie_txt,
                        txtColor: HexColor(twitter_color),
                        fontSize: 13.0,
                        onTap: () {}),
                  )
                ],
              ),
            ),
            30.heightBox,
            // Already have an account? Log in Text
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: have_accnt_txt,
                    style: TextStyle(color: Vx.gray600, fontSize: 14),
                  ),
                  WidgetSpan(
                    child: txtButton(
                        txt: login_txt,
                        txtColor: HexColor(twitter_color),
                        fontSize: 14.0,
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => logInView()));
                        }),
                  )
                ],
              ),
            ),
            20.heightBox
          ])
        ]).marginOnly(left: 25, right: 25)));
  }
}
