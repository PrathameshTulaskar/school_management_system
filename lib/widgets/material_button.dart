import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/constants/color_constant.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Function()? onTap;
  final Color? textColor;
  final bool? isActive;

  const NormalButton({
    super.key,
    required this.text,
    this.onTap,
     this.backgroundColor,
    this.textColor,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color:isActive == false ? Colors.white : ColorConstant.primaryColor), // Set the border color here
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive == false ? Colors.white : ColorConstant.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
                color: isActive == false ?  ColorConstant.primaryColor :Colors.white ,
                fontFamily: 'Dekko',
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Function()? onTap;
  final Color? textColor;
  final bool? isActive;

  const GreenButton({
    super.key,
    required this.text,
    this.onTap,
     this.backgroundColor,
    this.textColor,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color:isActive == false ? Colors.white : ColorConstant.greenColor), // Set the border color here
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive == false ? Colors.white : ColorConstant.greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
                color: isActive == false ?  ColorConstant.primaryColor :Colors.white ,
                fontFamily: 'Dekko',
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
