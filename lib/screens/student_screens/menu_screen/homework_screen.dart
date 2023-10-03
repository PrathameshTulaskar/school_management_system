import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/material_button.dart';
import 'package:school_management_system/widgets/text_form_widget.dart';
import 'package:school_management_system/widgets/text_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constants/color_constant.dart';
import '../../../widgets/icon_widget.dart';

class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({Key? key}) : super(key: key);

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
    String formattedDate = DateFormat.yMMMMEEEEd().format(selectedDate);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        scrollCalender(),
        SizedBox(
          height: 20,
        ),
        mySubjects(formattedDate.toString())
      ],
    );
  }

  scrollCalender() {
    String formattedDate = DateFormat.yMMMMEEEEd().format(selectedDate);
    String day = DateFormat('d').format(selectedDate);
    String month = DateFormat('MMMM').format(selectedDate);
    String year = DateFormat('y').format(selectedDate);
    String weekday = DateFormat('EEEE').format(selectedDate);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            formattedDate,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container(
              //   // width: double.infinity,
              //   child: Column(
              //     children: [
              //       Container(
              //         padding: EdgeInsets.all(20),
              //
              //
              //         color: Color(0xFF89490E),
              //         child: Center(
              //           child:TextWidget("$day $month", TextStyleConstant.mediumFont.copyWith(color: Colors.white)),
              //         ),
              //       ),
              //       Container(
              //         padding: EdgeInsets.all(20),
              //
              //
              //         color: Color(0xFFE3C098),
              //         child: Center(
              //           child:TextWidget("$weekday", TextStyleConstant.mediumFont),
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // ),
              NormalButton(
                text: "Select Date",
                isActive: true,
                onTap: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  mySubjects(String date) {
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
            itemCount: listOfSubject.length, // Number of items in the grid
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Get.to(() => HomeWorkDescriptionScreen(
                          appBarTitle: listOfSubject[index],
                          date: date,
                          tileColor: ColorConstant.subjectColorList[index],
                        ));
                  },
                  child: IconWidget(ColorConstant.subjectColorList[index],
                      listOfSubject[index]));
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
      ],
    );
  }
}

class HomeWorkDescriptionScreen extends StatefulWidget {
  final String? appBarTitle;
  final String? date;
  final Color? tileColor;
  const HomeWorkDescriptionScreen(
      {Key? key, this.appBarTitle, this.date, this.tileColor})
      : super(key: key);

  @override
  State<HomeWorkDescriptionScreen> createState() =>
      _HomeWorkDescriptionScreenState();
}

class _HomeWorkDescriptionScreenState extends State<HomeWorkDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [homeworkTile()],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: appBarWidget("${widget.appBarTitle}", widget.date),
      ),
    );
  }

  appBarWidget(String title, date) {
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
            SizedBox(height: 40),
            Center(
                child: TextWidget(
                    "$date",
                    TextStyleConstant.mediumFont
                        .copyWith(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  homeworkTile() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.only(top: 40),
          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
                color: widget.tileColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // decoration: BoxDecoration(),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                  width: double.infinity,
                  // height:100,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextWidget("Teacher Name: Mr.Yogesh Ballewar",
                            TextStyleConstant.mediumFont.copyWith(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextWidget(
                            "Solve all the problem of chapter life science all doubts will solve on class",
                            TextStyleConstant.smallFont
                                .copyWith(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0, // Distance from the top
          // left: MediaQuery.of(context).size.width/3,     // Distance from the left
          child: CircleAvatar(
            backgroundColor: widget.tileColor,
            radius: 40,
            // backgroundImage:AssetImage("assets/images/hand.png"),
          ),
        ),
      ],
    );
  }
}
