import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/material_button.dart';
import 'package:school_management_system/widgets/text_widget.dart';

import '../../../widgets/banner_widget.dart';
import '../../../widgets/icon_widget.dart';
import '../../../widgets/notice_section.dart';
import 'subject_chapter_list.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
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
      children: [
        BannerWidget(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalButton(
              text: "My Subject",
              backgroundColor: isMySubject == true
                  ? ColorConstant.primaryColor
                  : Colors.white,
              onTap: () {
                setState(() {
                  isMySubject = true;
                });
              },
              textColor: isMySubject == false
                  ? ColorConstant.primaryColor
                  : Colors.white,
            ),
            // NormalButton(
            //   text: "Languages",
            //   backgroundColor: isMySubject == false
            //       ? ColorConstant.primaryColor
            //       : Colors.white,
            //   onTap: () {
            //     setState(() {
            //       isMySubject = false;
            //     });
            //   },
            //   textColor: isMySubject == true
            //       ? ColorConstant.primaryColor
            //       : Colors.white,
            // )
          ],
        ),
        MySubject(context,listOfSubject)
            // : Languages(context, LanguageList)
      ],
    );
  }
}

Widget MySubject(BuildContext context,List<String> subjectList) {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: double.maxFinite,

        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // crossAxisSpacing: 10,
              mainAxisExtent: 150),
          itemCount: subjectList.length, // Number of items in the grid
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  Get.to(() => SubjectChapterList(subjectName: subjectList[index],));
                },
                child: IconWidget(ColorConstant.subjectColorList[index], subjectList[index]));
          },
        ),
      ),
      SizedBox(
        height: 30,
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
    ],
  );
}


