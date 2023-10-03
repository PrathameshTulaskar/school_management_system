import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/screens/student_screens/home_screen/subject_chapter_list.dart';
import 'package:school_management_system/widgets/material_button.dart';
import 'package:school_management_system/widgets/text_widget.dart';

import '../../../widgets/banner_widget.dart';
import '../../../widgets/icon_widget.dart';
import '../../../widgets/notice_section.dart';

class StudentInformationScreen extends StatefulWidget {
  const StudentInformationScreen({Key? key}) : super(key: key);

  @override
  State<StudentInformationScreen> createState() =>
      _StudentInformationScreenState();
}

class _StudentInformationScreenState extends State<StudentInformationScreen> {
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: HomeAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            BannerWidget(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GreenButton(
                    text: "My Subject",
                    onTap: (){},
                    backgroundColor: ColorConstant.greenColor,
                    isActive: true,
                    textColor: Colors.white,
                  ),
                ),

              ],
            ),
            MySubject(context, listOfSubject)
            // : Languages(context, LanguageList)
          ],
        ),
      ),
    );
  }
}

Widget MySubject(BuildContext context, List<String> subjectList) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: double.maxFinite,

        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // crossAxisSpacing: 10,
              mainAxisExtent: 150),
          itemCount: subjectList.length, // Number of items in the grid
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Get.to(() => SubjectChapterList(subjectName: subjectList[index],));
                },
                child: IconWidget(
                    ColorConstant.subjectColorList[index], subjectList[index]));
          },
        ),
      ),
      const SizedBox(
        height: 30,
      ),

      const SizedBox(
        height: 20,
      ),

    ],
  );
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.green], // Define your gradient colors
          begin: Alignment.topLeft, // Define the starting point of the gradient
          end: Alignment.bottomRight, // Define the ending point of the gradient
          stops: [0.0, 1.0], // Define stops for color transitions
          tileMode:
              TileMode.clamp, // Define how the gradient should be repeated
        ),
        color: ColorConstant.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      // height: 400,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            left: -40,
            child: CircleAvatar(
              maxRadius: 100,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 5, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile_img.png'),

                  // Replace with your image asset
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // color:Colors.red,
                      width: MediaQuery.of(context).size.width / 2,

                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          TextWidget(
                              "Shashin Bhoyar ",
                              TextStyleConstant.largeFont
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                    TextWidget(
                        "Class 9 B/ Roll No.7",
                        TextStyleConstant.mediumFont.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w200)),
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
