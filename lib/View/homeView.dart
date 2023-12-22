import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/Utilities/Components/circleIconButton.dart';
import 'package:twitter_clone/Utilities/Components/circleImageButton.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utilities/Constants/imagePathes.dart';

class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            circleImageButton(
                img: FirebaseAuth.instance.currentUser!.photoURL, onTap: () {}),
            SvgPicture.asset(
              twitter_icn,
              height: 30,
              width: 30,
            ).marginOnly(left: 10),
            circleIconButton(
                btn_clr: Colors.transparent,
                icon: Icons.settings_outlined,
                onTap: () {})
          ],
        )),
        body: SafeArea(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Text(index.toString()).centered()
                      .box
                      .height(40)
                      .margin(EdgeInsets.only(top: 2.5))
                      .color(CupertinoColors.systemGrey5)
                      .make();
                })).marginOnly(left: 10, right: 10));
  }
}
