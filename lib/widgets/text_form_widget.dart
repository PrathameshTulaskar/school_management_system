import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';

class TextFormWidget extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String?  labelText;
  const TextFormWidget({Key? key, this.textEditingController,this.labelText})
      : super(key: key);

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController!,
      decoration: InputDecoration(
        labelText: '${widget.labelText}',
        labelStyle: TextStyleConstant.smallFont.copyWith(color: ColorConstant.primaryColor  ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.primaryColor), // Border color when focused
        ),
        border: const OutlineInputBorder(

        ), // Add a border to the input field
      ),
    );
  }
}
