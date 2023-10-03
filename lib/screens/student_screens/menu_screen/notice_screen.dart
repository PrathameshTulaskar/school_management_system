import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/text_widget.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  FlutterTts flutterTts = FlutterTts();
  String text = '';

  Future<void> _speak() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,

      children: [
        noticeTile(),
        noticeTile(),
        noticeTile(),
      ],
    );
  }

  noticeTile(){
    text = "School leadership and management";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 100),
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.yellow,/
        image: DecorationImage(image: AssetImage("assets/images/notice_back.png"),
          fit: BoxFit.cover)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget("School leadership and management", TextStyleConstant.largeFont.copyWith(fontSize: 25)),
          SizedBox(height:20),
          TextWidget("Leadership is focused on vision, motivation, the future, and the teams and people in your school. Management provides systems and processes essential to the smooth day-to- day running of the school. Both leadership and management are essential for successful school development.", TextStyleConstant.mediumFont.copyWith(fontWeight: FontWeight.w400,)),
          SizedBox(height:20),
          Align(
          alignment: Alignment.bottomCenter,
            child: IconButton(onPressed: _speak, icon: Icon(Icons.surround_sound,size: 50,)))

        ],
      ),
    );
  }
}


