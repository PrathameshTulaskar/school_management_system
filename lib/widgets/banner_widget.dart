import 'package:flutter/material.dart';
import 'package:school_management_system/widgets/text_widget.dart';

import '../constants/textstyle_constant.dart';

 BannerWidget()  {
  return Container(
    padding: EdgeInsets.all(20),
    width: double.infinity, // Adjust the width as needed
    height: 200, // Adjust the height as needed
    decoration: BoxDecoration(
      color: const Color(0xFFFDCEA3), // Container background color
      borderRadius:
      BorderRadius.circular(20), // Adjust the radius as needed
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("Exam Date", TextStyleConstant.extraLargeFont.copyWith(color: Color(0xFF6C1515),fontSize: 40,fontWeight: FontWeight.w400)),
        TextWidget("Your exam start date is\n02, Mar, 2023", TextStyleConstant.extraLargeFont.copyWith(color: Color(0xFF6C1515),fontSize: 20,fontWeight: FontWeight.w200))
      ],
    ),
  );
}