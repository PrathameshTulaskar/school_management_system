import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/widgets/text_widget.dart';

import '../constants/color_constant.dart';
import '../constants/textstyle_constant.dart';

Widget AssignmentCard(BuildContext context,Color? backgroundColor){
  String formattedDate = DateFormat.yMMMMd().format(DateTime.now());
  double sWidth = MediaQuery.of(context).size.width;
  double sHeight = MediaQuery.of(context).size.height;
  return Column(
    children: [
      Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: double.infinity,
          // height:double.maxFinite,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child:
                  TextWidget(formattedDate, TextStyleConstant.smallFont.copyWith(fontWeight: FontWeight.w200))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 80,
                      width: 80,
                      color: backgroundColor,
                      child: const Center(
                        child: Icon(Icons.format_color_fill,
                            color: Colors.white, size: 50),
                      )),
                  Column(
                    children: [
                      SizedBox(

                          width: sWidth / 2,
                          child: TextWidget("Basic of computer",
                              TextStyleConstant.mediumFont)),
                      SizedBox(
                          width: sWidth / 2,
                          child: TextWidget("Please upload only pdf computer",
                              TextStyleConstant.smallFont.copyWith(fontWeight: FontWeight.w200))),
                      SizedBox(
                          width: sWidth / 2,
                          child: TextWidget("Due, 27 July 2022, 10:20 AM",
                              TextStyleConstant.smallFont.copyWith(fontWeight: FontWeight.w600))),
                    ],
                  ),
                ],
              )
            ],
          )),
      SizedBox(height: 20,)
    ],
  );
}