import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class circleIconButton extends StatelessWidget {
  circleIconButton(
      {Key? key,
      required this.btn_clr,
      required this.icon,
      this.icon_clr,
      required this.onTap})
      : super(key: key);
  var btn_clr, icon, icon_clr, onTap;

  @override
  Widget build(BuildContext context) {
    return

      Material(
      borderRadius: BorderRadius.circular(100),
      color: btn_clr,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Ink(
          height: 35, width: 35,
          child: Icon(icon, color: icon_clr),
        ),
      ),
    );
  }
}
