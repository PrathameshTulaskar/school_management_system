import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/text_widget.dart';

import '../../../widgets/assignment_card.dart';
import '../../../widgets/material_button.dart';
import 'assignment_details_screen.dart';

class StudentAssignmentScreen extends StatefulWidget {
  const StudentAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<StudentAssignmentScreen> createState() =>
      _StudentAssignmentScreenState();
}

class _StudentAssignmentScreenState extends State<StudentAssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(DateTime.now());
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [


        Container(
          height:80,
          width: double.infinity,
          // color: Colors.red,
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(

              children:[
                NormalButton(backgroundColor:ColorConstant.primaryColor,text: "All Subject",onTap: (){},),

                SizedBox(width: 20,),NormalButton(backgroundColor:Colors.white ,text: "English",onTap: (){},textColor: ColorConstant.primaryColor,)
                ,SizedBox(width: 20,),NormalButton(backgroundColor:Colors.white ,text: "Maths",onTap: (){},textColor: ColorConstant.primaryColor,)
                ,SizedBox(width: 20,),NormalButton(backgroundColor:Colors.white ,text: "Science",onTap: (){},textColor: ColorConstant.primaryColor,)
                ,SizedBox(width: 20,),NormalButton(backgroundColor:Colors.white ,text: "History",onTap: (){},textColor: ColorConstant.primaryColor,)

              ]
            ),
          ),
        ),
        const SizedBox(height:20),
        for(int i=0;i< ColorConstant.subjectColorList.length;i++)
          GestureDetector(
              child: AssignmentCard(context, ColorConstant.subjectColorList[i]),
            onTap: (){
               // Get.offAll(()=> AssignmentDetailsScreen());
               Get.to(() => AssignmentDetailsScreen());
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => AssignmentDetailsScreen()),
              // );
            },

          ),
      ],
    );
  }
}
