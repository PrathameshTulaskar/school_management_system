import 'package:flutter/material.dart';
import 'package:school_management_system/constants/color_constant.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/material_button.dart';
import 'package:school_management_system/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlineClassScreen extends StatefulWidget{
  const OnlineClassScreen({Key? key}) : super(key: key);

  @override
  State<OnlineClassScreen> createState() => _OnlineClassScreenState();
}

class _OnlineClassScreenState extends State<OnlineClassScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        _onlineClasBox()
      ],
    );
  }

  _onlineClasBox(){
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.blue.withOpacity(0.5)
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.file_copy_outlined,color: Colors.white,
            size: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width/3,
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
                width: MediaQuery.of(context).size.width/3,
                child: Wrap(
                  children: [
                    TextWidget(
                        "By Shashin Bhoyar Sir",
                        TextStyleConstant.smallFont
                            .copyWith(fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          NormalButton(text: "Join", backgroundColor: ColorConstant.primaryColor,onTap: (){
            _launchURL();
          },)
        ],
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://meet.google.com/hkf-ppna-mtn';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
