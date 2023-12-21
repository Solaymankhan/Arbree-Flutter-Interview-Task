import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class button extends StatelessWidget {
  button(
      {Key? key,
      required this.btn_clr,
      this.icon,
      this.txt,
        this.txt_clr,
      required this.onTap})
      : super(key: key);

  var btn_clr, icon, txt,txt_clr, onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: btn_clr,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Ink(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                SvgPicture.asset(
                  icon,
                  height: 25,
                  width: 25,
                ),
              SizedBox(width: 8),
              if (txt != null)
                Text(txt,
                    style: TextStyle(
                        color: txt_clr,fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    )
        .box
        .height(40)
        .border(color: Vx.gray400, width: 0.5)
        .customRounded(BorderRadius.circular(100))
        .make();
  }
}
