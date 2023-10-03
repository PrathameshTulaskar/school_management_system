import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/screens/student_screens/menu_screen/result_screen.dart';
import 'package:school_management_system/screens/student_screens/menu_screen/semester_time_table_screen.dart';
import 'package:school_management_system/widgets/material_button.dart';
import 'package:school_management_system/widgets/text_widget.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _rowButton(),
        SizedBox(
          height: 20,
        ),
        selectedIndex == 0
            ? SizedBox()
            : selectedIndex == 1
                ? _pastExamBox()
                : selectedIndex == 2
                    ? _upcomingExamBox()
                    : SizedBox(),
      ],
    );
  }

  _rowButton() {
    return Container(
      width: double.infinity,
      child: Wrap(
        runSpacing: 10,
        runAlignment: WrapAlignment.spaceEvenly,
        spacing: 20,
        children: [
          NormalButton(
              text: "Current Exam",
              backgroundColor: ColorConstant.primaryColor,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              isActive: selectedIndex == 0 ? true : false),
          NormalButton(
              text: "Past Exam",
              backgroundColor: ColorConstant.primaryColor,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              isActive: selectedIndex == 1 ? true : false),
          NormalButton(
              text: "Upcoming Exam",
              backgroundColor: ColorConstant.primaryColor,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              isActive: selectedIndex == 2 ? true : false),
        ],
      ),
    );
  }

  _upcomingExamBox() {
    return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/paper_img.png"))),
              height: 100,
              width: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Wrap(
                    children: [
                      TextWidget(
                          "Second Semester ",
                          TextStyleConstant.largeFont
                              .copyWith(fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Wrap(
                    children: [
                      TextWidget(
                          "Starting : ",
                          TextStyleConstant.mediumFont.copyWith(
                              fontWeight: FontWeight.w200,
                              color: ColorConstant.primaryColor)),
                      TextWidget(
                          "20/02/2023",
                          TextStyleConstant.mediumFont
                              .copyWith(fontWeight: FontWeight.w200)),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Wrap(
                    children: [
                      TextWidget(
                          "Ending : ",
                          TextStyleConstant.mediumFont.copyWith(
                              fontWeight: FontWeight.w200,
                              color: ColorConstant.primaryColor)),
                      TextWidget(
                          "20/02/2023",
                          TextStyleConstant.mediumFont
                              .copyWith(fontWeight: FontWeight.w200)),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                NormalButton(
                  text: "View Time Table",
                  backgroundColor: ColorConstant.primaryColor,
                  isActive: true,
                  onTap: () {
                    Get.to(() => const SemesterTimeTable());

                  },
                )
              ],
            )
          ],
        ));
  }

  _pastExamBox() {
    return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/paper_img.png"))),
              height: 100,
              width: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Wrap(
                    children: [
                      TextWidget(
                          "First Semester ",
                          TextStyleConstant.largeFont
                              .copyWith(fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Wrap(
                    children: [
                      TextWidget(
                          "Starting : ",
                          TextStyleConstant.mediumFont.copyWith(
                              fontWeight: FontWeight.w200,
                              color: ColorConstant.primaryColor)),
                      TextWidget(
                          "20/02/2023",
                          TextStyleConstant.mediumFont
                              .copyWith(fontWeight: FontWeight.w200)),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Wrap(
                    children: [
                      TextWidget(
                          "Ending : ",
                          TextStyleConstant.mediumFont.copyWith(
                              fontWeight: FontWeight.w200,
                              color: ColorConstant.primaryColor)),
                      TextWidget(
                          "20/02/2023",
                          TextStyleConstant.mediumFont
                              .copyWith(fontWeight: FontWeight.w200)),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                NormalButton(
                  text: "View Result",
                  backgroundColor: ColorConstant.primaryColor,
                  isActive: true,
                  onTap: () {

                    Get.to(() => const ResultScreen());
                  },
                )
              ],
            )
          ],
        ));
  }
}
