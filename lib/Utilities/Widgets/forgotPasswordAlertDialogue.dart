import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../../ViewModel/Functions/HexColor.dart';
import '../Components/button.dart';
import '../Constants/colors.dart';
import '../Constants/strings.dart';

class forgotPasswordAlertDialogue extends StatelessWidget {
  forgotPasswordAlertDialogue({Key? key,required this.onTapOk}) : super(key: key);
  var  onTapOk;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(forgot_password_alert1_txt,
          style: TextStyle(fontWeight: FontWeight.bold)),
      content: Text(forgot_password_alert2_txt,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      actions: [
        Container(
          width: 90,
          height: 35,
          child: button(
              btn_clr: HexColor(twitter_color),
              txt: cancel_txt,
              txt_clr: Colors.white,
              onTap: (){
                Navigator.of(context).pop();
              }),
        ),
        Container(
          width: 90,
          height: 35,
          child: button(
              btn_clr: HexColor(twitter_color),
              txt: ok_txt,
              txt_clr: Colors.white,
              onTap: onTapOk),
        )
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
