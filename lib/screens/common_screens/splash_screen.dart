import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/screens/common_screens/login_screen.dart';
import 'package:school_management_system/services/local_storage.dart';
import '../../constants/color_constant.dart';
import '../../widgets/material_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(

            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              color: ColorConstant.primaryColor,
              image: DecorationImage(
                image: AssetImage('assets/gifs/bulb_idea.gif'), // Replace with your GIF asset
                fit: BoxFit.cover,
              ),
            ),

          ),
          const SizedBox(height:20),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white),
            height: sHeight / 2,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Center(
                  child: Text(
                    'eSchool',
                    style: TextStyle(
                        fontFamily: 'Dekko',
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Center(
                  child: Text(
                    'eSchool serves you virtual\nEducation at your home',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Dekko',
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 20,),
                NormalButton(
                  onTap: (){
                    LocalStorageService.setUserType("Student");
                    Get.offAll(()=>const LoginScreen());
                  },
                  text: 'Login as Student',
                  backgroundColor: ColorConstant.primaryColor,
                ),
                SizedBox(height: 20),
                NormalButton(
                  onTap: (){
                    LocalStorageService.setUserType("Parent");
                    Get.offAll(()=>const LoginScreen());
                  },
                  text: 'Login as parent',
                  backgroundColor: Colors.green,
                ),
                SizedBox(height: 20),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Powered By ',
                      style:  TextStyleConstant.mediumFont.copyWith(color: Colors.black,),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Head',
                            style:  TextStyleConstant.mediumFont.copyWith(color: Colors.blue,)
                        ),
                        TextSpan(
                          text: 'Way',
                          style: TextStyleConstant.mediumFont.copyWith(color: Colors.red),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
