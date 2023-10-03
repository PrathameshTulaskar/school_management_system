import 'package:flutter/material.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/textstyle_constant.dart';
import '../../../widgets/text_widget.dart';


class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({Key? key}) : super(key: key);

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < ColorConstant.subjectColorList.length; i++)
          timeTableBox(ColorConstant.subjectColorList[i])
      ],
    );
  }


  Widget timeTableBox(Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 80,
                width: 80,
                color: color,
                child: Icon(
                  Icons.folder_copy_outlined,
                  size: 40,
                  color: Colors.white,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                    child: Wrap(
                      children: [
                        TextWidget(
                            "8 AM to 9 AM ",
                            TextStyleConstant.mediumFont
                                .copyWith(fontWeight: FontWeight.w600)),
                      ],
                    )),
                TextWidget("Maths", TextStyleConstant.smallFont),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: Wrap(
                    children: [
                      TextWidget(
                          "By Shashin Bhoyar Sir",
                          TextStyleConstant.mediumFont
                              .copyWith(fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
