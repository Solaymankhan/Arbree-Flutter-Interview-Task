

import 'package:flutter/material.dart';

HexColor(String color){
  String newColor='0xff'+color;
  newColor=newColor.replaceAll('#','');
  try{
    return Color(int.parse(newColor));
  }catch(e){
    return Colors.white;
  }

}