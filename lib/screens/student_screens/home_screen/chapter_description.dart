import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/material_button.dart';

import '../../../constants/color_constant.dart';
import '../../../widgets/text_widget.dart';

class ChapterDescriptionPage extends StatefulWidget {
  const ChapterDescriptionPage({Key? key}) : super(key: key);

  @override
  State<ChapterDescriptionPage> createState() => _ChapterDescriptionPageState();
}

class _ChapterDescriptionPageState extends State<ChapterDescriptionPage> {
  int index= 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarWidget(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NormalButton(text: "Topic", backgroundColor: index == 1 ?ColorConstant.primaryColor : Colors.white,
                  textColor: index == 1 ? Colors.white : ColorConstant.primaryColor,
                  onTap: (){
                  setState(() {
                    index = 1;
                  });
                  },),
                NormalButton(text: "File",
                    backgroundColor:index == 2 ? ColorConstant.primaryColor: Colors.white,
                    textColor: index == 2 ? Colors.white : ColorConstant.primaryColor,
                    onTap: (){
                  setState(() {
                    index = 2;
                  });
                    }),

              ],
            ),
            SizedBox(height: 40,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               index == 1 ?  topicSection() : fileSection(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget AppBarWidget() {
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
                      "Baic Of Computer",
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

Widget topicSection(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      topicDescription("Topic name","Keyboard"),
      SizedBox(height:30),
      topicDescription("Topic Description","Intro Keyboard"),
    ],
  );
}


Widget topicDescription(title, desc){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      TextWidget("$title", TextStyleConstant.mediumFont.copyWith(fontWeight: FontWeight.w400)),
      TextWidget("$desc", TextStyleConstant.largeFont.copyWith(fontWeight: FontWeight.w800)),
    ],
  );
}

Widget fileSection(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      fileDescription(),
      fileDescription(),
      fileDescription(),
      fileDescription(),
    ],
  );
}

Widget fileDescription(){
  return Padding(
    padding: const EdgeInsets.only(bottom:20),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.withOpacity(0.3)
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget("Basic of computer.pdf", TextStyleConstant.mediumFont.copyWith(fontWeight: FontWeight.w400)),
          IconButton(onPressed: (){}, icon: Icon(Icons.download_outlined,size: 40,))
        ],
      ),
    ),
  );
}