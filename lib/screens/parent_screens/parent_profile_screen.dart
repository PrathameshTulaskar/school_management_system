import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/screens/parent_screens/student_information_screen.dart';
import 'package:school_management_system/widgets/material_button.dart';
import 'package:school_management_system/widgets/text_widget.dart';

import '../../../widgets/banner_widget.dart';
import '../../../widgets/icon_widget.dart';
import '../../../widgets/notice_section.dart';

class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen({Key? key}) : super(key: key);

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  bool isMySubject = true;
  List<String> LanguageList = [
    "Marathi",
    "Hindi",
    "English",
    "Urdu",
    "Gujarati",
    "Kannada",
    "Telugu",
    "Konkani"
  ];

  List<String> listOfSubject = [
    "Maths",
    "Science",
    "English",
    "Marathi",
    "Hindi",
    "History",
    "Geography",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerWidget(),
        const SizedBox(
          height: 40,
        ),
        listOfChildren()
        // : Languages(context, LanguageList)
      ],
    );
  }

  listOfChildren() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("My Child's", TextStyleConstant.mediumFont),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => StudentInformationScreen());
              },
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  TextWidget('Shashin Bhoyar', TextStyleConstant.mediumFont)
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                TextWidget('Shashin Bhoyar', TextStyleConstant.mediumFont)
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        noticeSection(),
      ],
    );
  }
}

noticeSection() {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
              "Latest Notice",
              TextStyleConstant.largeFont
                  .copyWith(fontWeight: FontWeight.w400)),
          TextWidget(
              "View All",
              TextStyleConstant.smallFont
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.blue)),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      NoticeSection(),
      SizedBox(
        height: 20,
      ),
      NoticeSection(),
    ],
  );
}
