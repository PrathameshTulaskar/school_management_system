import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/image_constants.dart';
import 'package:school_management_system/screens/student_screens/menu_screen/menu_detail_screen.dart';

import '../../../constants/textstyle_constant.dart';
import '../../../widgets/text_widget.dart';

class StudentMenuScreen extends StatefulWidget {
  const StudentMenuScreen({Key? key}) : super(key: key);

  @override
  State<StudentMenuScreen> createState() => _StudentMenuScreenState();
}

class _StudentMenuScreenState extends State<StudentMenuScreen> {

  List<String> menuTitle =
  [
    "Homework",
    "Attendance",
    "TimeTable",
    "Notice",
    "Events",
    "Parent Profile",
    "Online Class",
    "Performance",
    "Setting",
    "Exam",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: double.maxFinite,

          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // crossAxisSpacing: 10,
                mainAxisExtent: 150),
            itemCount: menuTitle.length, // Number of items in the grid
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: (){
                    Get.to(() => MenuDetailsScreen(appbarTitle: menuTitle[index],index: index,));
                  },
                  child: roundedWidget(menuTitle[index],ImageConstant.menuSectionImgList[index]));
            },
          ),
        ),
      ],
    );
  }
}

Widget roundedWidget(title,img){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 52,
        backgroundColor: Colors.transparent,

        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: GradientAvatar(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFC737
                  ), Color(0xFFB402A3).withOpacity(0.6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                radius: 50,

              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child:Image.asset("assets/images/$img.png",height: 70,))
          ],
        ),
      ),
      TextWidget( "$title", TextStyleConstant.mediumFont.copyWith(fontWeight: FontWeight.w400))
    ],
  );
}

class GradientAvatar extends StatelessWidget {
  final double radius;
  final Gradient gradient;


  GradientAvatar({
    required this.radius,
    required this.gradient,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
      ),
      child: Center(
        child: ClipOval(
          child: SizedBox(
            width: radius * 2 - 10, // Adjust the size to create a border effect
            height: radius * 2 - 10,
            // child: child,
          ),
        ),
      ),
    );
  }
}