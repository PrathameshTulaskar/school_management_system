import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/color_constant.dart';
import '../../../constants/textstyle_constant.dart';
import '../../../widgets/text_widget.dart';

class AssignmentDetailsScreen extends StatefulWidget {
  final BuildContext? context;
  const AssignmentDetailsScreen({Key? key, this.context}) : super(key: key);

  @override
  State<AssignmentDetailsScreen> createState() =>
      _AssignmentDetailsScreenState();
}

class _AssignmentDetailsScreenState extends State<AssignmentDetailsScreen> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              subjectName(),
              SizedBox(height: 20),
              DottedCircle("Subject Teacher Name", "Sonam Gupta"),
              SizedBox(height: 20),
              DottedCircle("Due Date", "Due, 27 July 2022, 10:20 AM"),
              SizedBox(height: 20),
              DottedCircle("Instructions", "Please upload only PDF"),
              SizedBox(height: 20),
              DottedCircle("Marks on assignment", "35"),
              SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}


Widget AppBarWidget(){
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
                  onPressed:(){Get.back();},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 40,
                  )),
              Center(
                  child: TextWidget(
                      "Assignments",
                      TextStyleConstant.largeFont
                          .copyWith(color: Colors.white))),
              Icon(
                Icons.arrow_back,
                color: ColorConstant.primaryColor,
              )
            ],
          ),
          SizedBox(height: 10),

          TextWidget("Basic Of Computer", TextStyleConstant.largeFont.copyWith(color: Colors.white))
        ],
      ),
    ),
  );
}

Widget subjectName() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                "Subject Name",
                TextStyleConstant.mediumFont
                    .copyWith(fontWeight: FontWeight.w400)),
            SizedBox(
              height: 10,
            ),
            TextWidget(
                "Computer",
                TextStyleConstant.mediumFont
                    .copyWith(fontWeight: FontWeight.w600))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.file_copy,
              size: 40,
            ))
      ],
    ),
  );
}

Widget DottedCircle(String title,subtitle) {
  return Container(
    decoration: BoxDecoration(
      color: ColorConstant.primaryColor.withOpacity(0.5),
      // strokeWidth: 2,
      // dashPattern: [5, 5], // Adjust the dash and gap lengths
      // borderType: BorderType.RRect,
      // border: Radius.circular(10),
    ),
// Optional: Rounded corners
    child: Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  title,
                  TextStyleConstant.mediumFont
                      .copyWith(fontWeight: FontWeight.w400)),
              SizedBox(
                height: 10,
              ),
              TextWidget(
                  subtitle,
                  TextStyleConstant.mediumFont
                      .copyWith(fontWeight: FontWeight.w600))
            ],
          ),
         
        ],
      )
    ),
  );
}
