import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/screens/student_screens/menu_screen/event_screen.dart';
import 'package:school_management_system/screens/student_screens/menu_screen/exam_screen.dart';
import 'package:school_management_system/screens/student_screens/menu_screen/online_class_screen.dart';
import 'package:school_management_system/screens/student_screens/menu_screen/setting_screen.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/textstyle_constant.dart';
import '../../../widgets/text_widget.dart';
import 'attendance_screen.dart';
import 'homework_screen.dart';
import 'notice_screen.dart';
import 'parent_profile.dart';
import 'performance_screen.dart';
import 'time_table_screen.dart';

class MenuDetailsScreen extends StatefulWidget {
  final int index;
  final String? appbarTitle;
  const MenuDetailsScreen({Key? key, this.appbarTitle, required this.index})
      : super(key: key);

  @override
  State<MenuDetailsScreen> createState() => _MenuDetailsScreenState();
}

class _MenuDetailsScreenState extends State<MenuDetailsScreen> {
  List<Widget> listOfWidget = [
    HomeworkScreen(),
    AttendanceScreen(),
    TimeTableScreen(),
    NoticeScreen(),
    EventScreen(),
    ParentProfile(),
    OnlineClassScreen(),
    PerformanceScreen(),
    SettingScreen(),
    ExamScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: _appBarWidget("${widget.appbarTitle}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [listOfWidget[widget.index]],
          ),
        ),
      ),
    );
  }
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
