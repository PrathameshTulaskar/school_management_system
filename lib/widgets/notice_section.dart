import 'package:flutter/material.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/text_widget.dart';

Widget NoticeSection(){
  return Container(
    padding: EdgeInsets.all(20),
    width: double.infinity,
    
    decoration: const BoxDecoration(
      color: Color(0xFFA1D2FF),
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(0),topRight:  Radius.circular(30),bottomLeft:  Radius.circular(30), topLeft: Radius.circular(30)),
    ),
    
    child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("School Unit Test", TextStyleConstant.mediumFont.copyWith(fontWeight: FontWeight.w600,fontSize: 22)),
        TextWidget("school unit test start for next Monday to Friday all the student is mandatory to attend the exam.",
            TextStyleConstant.smallFont.copyWith(fontWeight: FontWeight.w400,fontSize: 18))
      ],
    )
  );
}