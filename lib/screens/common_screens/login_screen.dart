import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/screens/parent_dashboard.dart';
import 'package:school_management_system/screens/student_screens/student_dashboard.dart';
import 'package:school_management_system/services/local_storage.dart';
import 'package:school_management_system/widgets/material_button.dart';

import '../../constants/color_constant.dart';
import '../../widgets/text_form_widget.dart';
import '../../widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          // color: ColorConstant.primaryColor,
          image: DecorationImage(
            image: AssetImage(
                'assets/images/login_back.png'), // Replace with your GIF asset
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget("Let's Sign In", TextStyleConstant.extraLargeFont),
              TextWidget("Welcome Back,\nYou've been missed!",
                  TextStyleConstant.largeFont),
              const SizedBox(
                height: 40,
              ),
              TextFormWidget(
                labelText: "GR Number",
                textEditingController: id,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                labelText: "Password",
                textEditingController: password,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: TextWidget("Reset Password?", TextStyleConstant.smallFont)),
              const SizedBox(
                height: 20,
              ),
               Center(child: NormalButton(text: "Sign In", backgroundColor: ColorConstant.primaryColor,onTap: (){

                 if(LocalStorageService.getUserType() == "Student")
                   {
                     Get.offAll(()=>const StudentDashboard());
                   }
                 else if(LocalStorageService.getUserType() == "Parent")
                   {
                     Get.offAll(()=>const ParentDashboard());
                   }

              },)),
              const SizedBox(
                height: 10,
              ),
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
        ),
      ),
    );
  }
}
