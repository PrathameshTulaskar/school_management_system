import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/textstyle_constant.dart';
import '../../../widgets/text_widget.dart';
import 'chapter_description.dart';

class SubjectChapterList extends StatefulWidget {
  final String? subjectName;
  const SubjectChapterList({Key? key,this.subjectName}) : super(key: key);

  @override
  State<SubjectChapterList> createState() => _SubjectChapterListState();
}

class _SubjectChapterListState extends State<SubjectChapterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarWidget(widget.subjectName),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),

        children: [
          ChapterBox(),
          ChapterBox(),
          ChapterBox(),
          ChapterBox(),
          ChapterBox(),
          ChapterBox(),
          ChapterBox(),

        ],
      ),
    );
  }
}
Widget AppBarWidget(subjectName){
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
                      "$subjectName",
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

Widget ChapterBox() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: GestureDetector(
      onTap: (){
        Get.to(() => ChapterDescriptionPage());
      },
      child: Container(
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
                    "Chapter Name",
                    TextStyleConstant.mediumFont
                        .copyWith(fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    "Basic Of Computer",
                    TextStyleConstant.mediumFont
                        .copyWith(fontWeight: FontWeight.w600))
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.file_copy_outlined,
                  size: 40,
                ))
          ],
        ),
      ),
    ),
  );
}



