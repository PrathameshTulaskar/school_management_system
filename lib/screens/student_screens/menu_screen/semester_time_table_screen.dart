import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/textstyle_constant.dart';
import '../../../widgets/text_widget.dart';

class SemesterTimeTable extends StatefulWidget {
  const SemesterTimeTable({Key? key}) : super(key: key);

  @override
  State<SemesterTimeTable> createState() => _SemesterTimeTableState();
}

class _SemesterTimeTableState extends State<SemesterTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: Table(
                  border: TableBorder.all(color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),

                  ),
                  // defaultColumnWidth: FixedColumnWidth(100.0),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryColor, // Header row color
                      ),
                      children: [
                        TableCell(child: Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextWidget("Subject", TextStyleConstant.largeFont.copyWith(color: Colors.white)),
                        ))),
                        TableCell(child: Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextWidget("Time", TextStyleConstant.largeFont.copyWith(color: Colors.white)),
                        ))),
                        TableCell(child: Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextWidget("Date", TextStyleConstant.largeFont.copyWith(color: Colors.white)),
                        ))),



                      ],
                    ),
                    for (int i = 0; i < 5; i++)
                      TableRow(
                        decoration: BoxDecoration(
                          color: i % 2 == 0 ? Colors.white : Colors.grey[200], // Alternating row colors
                        ),
                        children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: TextWidget("Maths", TextStyleConstant.smallFont)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: TextWidget("8 AM - 9 PM", TextStyleConstant.smallFont)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: TextWidget("20 Aug 2023", TextStyleConstant.smallFont)),
                          )),


                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),


      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: _appBarWidget("Second Semester"),

      ),

    );
  }

  _appBarWidget(String title) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorConstant.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      height: 400,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  // onPressed: () {
                  //   print("hello");
                  //   Get.back();
                  // },
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    )),
                Center(
                    child: TextWidget(
                        "$title",
                        TextStyleConstant.largeFont
                            .copyWith(color: Colors.white))),
                Icon(
                  Icons.arrow_back,
                  color: ColorConstant.primaryColor,
                )
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
