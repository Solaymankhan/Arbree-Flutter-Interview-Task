import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class circleImageButton extends StatelessWidget {
  circleImageButton({Key? key, required this.img, required this.onTap})
      : super(key: key);
  var img, onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 30,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(100))),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: onTap,
          ),
        ),
      ],
    )
        .box.height(30).width(30)
        .border(width: 0.5, color: CupertinoColors.systemGrey5)
        .roundedFull
        .make();
  }
}
