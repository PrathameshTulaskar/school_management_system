import 'package:flutter/material.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/text_widget.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key}) : super(key: key);

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              detailsTile('Parent Name', 'Janab Onais Momin'),
              detailsTile("Date of Birth", "15 aug 147"),
            ]),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_img.png'),
                backgroundColor: Colors.black12,
                radius: 60 ,
                // child: Image.asset("assets/images/profile_img.png",fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        detailsTile("Email", "onais@ybites.com"),
        detailsTile("Profession", "Operational Manager"),
        detailsTile("Mobile no", "7897564513"),
        detailsTile("Address", 'G! kalika prasad sayog mandir road thane'),
      ],
    );
  }

  detailsTile(title, subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("$title",
            TextStyleConstant.mediumFont.copyWith(fontWeight: FontWeight.w200)),
        TextWidget("$subtitle", TextStyleConstant.mediumFont),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
