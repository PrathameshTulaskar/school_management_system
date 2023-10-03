import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/screens/student_screens/assignment_screen/student_assignement_screen.dart';
import 'package:school_management_system/screens/student_screens/menu_screen/student_menu_screen.dart';
import 'package:school_management_system/widgets/text_widget.dart';

import '../../widgets/material_button.dart';
import 'home_screen/student_home_screen.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _currentIndex = 0;
  final List<IconData> _icons = [
    Icons.home,
    Icons.edit_note_rounded,
    Icons.dashboard,
  ];
  final List<String> _iconLabel = [
    "Home",
    "Assignments",
    "Menu",
  ];
  final List<Widget> _appBarWidget = [
    const HomeAppBar(
      backgroundColor: ColorConstant.primaryColor,
    ),
    const AssignmentAppBar(
      backgroundColor: ColorConstant.primaryColor,
    ),
    const HomeAppBar(
      backgroundColor: ColorConstant.primaryColor,
    ),
  ];


  List<Widget> listOfStudentWidget =[
    StudentHomeScreen(),
    StudentAssignmentScreen(),
    StudentMenuScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: _appBarWidget[_currentIndex],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [listOfStudentWidget[_currentIndex]],
        ),
      ),
      bottomNavigationBar: RoundedBottomNavigationBar(
        icons: _icons,

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  final Color backgroundColor;

  const HomeAppBar({
    super.key,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
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
                backgroundImage:
                AssetImage('assets/images/profile_img.png'),

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
                              TextStyleConstant.largeFont.copyWith(
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    TextWidget(
                        "Class 9 B/ Roll No.7",
                        TextStyleConstant.mediumFont.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w200)),
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

class AssignmentAppBar extends StatefulWidget {
  final Color backgroundColor;

  const AssignmentAppBar({
    super.key,
    required this.backgroundColor,
  });

  @override
  State<AssignmentAppBar> createState() => _AssignmentAppBarState();
}

class _AssignmentAppBarState extends State<AssignmentAppBar> {
  bool isAssigned = true;
  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                TextWidget("Assignments", TextStyleConstant.largeFont.copyWith(color: Colors.white)),
                IconButton(onPressed: (){}, icon: Icon(Icons.sort,size: 40,color: Colors.white,))
              ],
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NormalButton(
                  text: "Assigned",
                  backgroundColor: isAssigned == true
                      ? ColorConstant.primaryColor.withOpacity(0.1)
                      : Colors.white,
                  onTap: () {
                    setState(() {
                      isAssigned = true;
                    });
                  },
                  textColor: isAssigned == false
                      ? ColorConstant.primaryColor
                      : Colors.white,
                ),
                NormalButton(
                  text: "Submitted",
                  backgroundColor: isAssigned == false
                      ? ColorConstant.primaryColor.withOpacity(0.1)
                      : Colors.white,
                  onTap: () {
                    setState(() {
                      isAssigned = false;
                    });
                  },
                  textColor: isAssigned == true
                      ? ColorConstant.primaryColor
                      : Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuAppBar extends StatelessWidget {
  final Color backgroundColor;

  const MenuAppBar({
    super.key,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
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

    );
  }
}

class RoundedBottomNavigationBar extends StatelessWidget {
  final List<IconData> icons;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const RoundedBottomNavigationBar({super.key,
    required this.icons,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      child: BottomNavigationBar(
        backgroundColor: ColorConstant.primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(size: 50),
        currentIndex: currentIndex,
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: icons.map((icon) {
          return BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              // padding: EdgeInsets.all(_currentIndex == 2 ? 12 : 8),
              child: Icon(icon),
            ),
            label: '',
          );
        }).toList(),
      ),
    );
  }
}


