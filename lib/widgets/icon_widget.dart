import 'package:flutter/material.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/text_widget.dart';

Widget IconWidget(Color? backgroundColor,String title){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: backgroundColor,
        maxRadius: 40,
        child: Center(
          child: Icon(Icons.file_copy_outlined,color: Colors.white,size: 35,),
        ),
      ),
      TextWidget( "$title", TextStyleConstant.mediumFont.copyWith(fontWeight: FontWeight.w400))
    ],
  );
}