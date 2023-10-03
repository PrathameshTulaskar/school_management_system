import 'package:flutter/material.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/material_button.dart';
import 'package:school_management_system/widgets/text_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      Container(
  width: double.infinity,
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey,),
      borderRadius: BorderRadius.all(Radius.circular(10),
    )
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.folder_copy_outlined,size: 40,color: Colors.black,),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget("Application Language", TextStyleConstant.mediumFont),
          TextWidget("English", TextStyleConstant.smallFont.copyWith(fontWeight: FontWeight.w200)),

        ],
      ),
      TextWidget('change', TextStyleConstant.smallFont.copyWith(fontWeight: FontWeight.w200,color: Colors.blue))
    ],
  ),
),
          SizedBox(height: 50,),
          textIcon("Privacy Policy"),
          textIcon("Terms And Conditions"),
          textIcon("About Us"),
          textIcon("Contact Us"),
          SizedBox(height: 20,),
          NormalButton(text: "Logout",onTap: (){},isActive: true,)
        ],
      ),
    );
  }
  
  textIcon(String title)
  {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget("$title", TextStyleConstant.mediumFont),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
        
  }
}
