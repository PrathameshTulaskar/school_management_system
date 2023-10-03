import 'package:flutter/material.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/text_widget.dart';

class EventScreen extends StatefulWidget{
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _eventBox(),
        SizedBox(height: 20,),
        _eventBox(),
        SizedBox(height: 20,),
        _eventBox(),
      ],
    );
  }

  _eventBox(){
    return Stack(
      alignment: Alignment.topCenter,
      children: [

        Container(
          padding: EdgeInsets.only(top:80),
          child: Container(
            width: double.infinity,


              decoration:  BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            // decoration: BoxDecoration(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60),
                  width:double.infinity,
                  // height:100,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextWidget("Drawing Competition", TextStyleConstant.largeFont),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width:double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight:  Radius.circular(20), bottomLeft: Radius.circular(20)),
                    color: Color(0xFFC38C82).withOpacity(0.2),
                  ),

                  child:Column(
                    children: [
                      TextWidget("25 Dec 2023", TextStyleConstant.mediumFont),
                      TextWidget("8 AM - 9 PM", TextStyleConstant.smallFont),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextWidget("FREE", TextStyleConstant.mediumFont.copyWith(color:Color(0xFF952EAE) ))),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,      // Distance from the top
          // left: MediaQuery.of(context).size.width/3,     // Distance from the left
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 60,
            backgroundImage:AssetImage("assets/images/hand.png"),
          ),
        ),
      ],
    );
  }
}
