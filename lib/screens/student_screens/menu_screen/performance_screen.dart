import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/constants/color_constant.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({Key? key}) : super(key: key);

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  @override
  Widget build(BuildContext context) {
    List<double> pieValue = [
      20,40,10,5,15
    ];

    return Center(
      child: AspectRatio(

        aspectRatio: 1,
        child:PieChart(

          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: [

              for(int i=0;i< pieValue.length;i++)
              PieChartSectionData(
              radius: 120,
              value: pieValue[i],
              color: ColorConstant.subjectColorList[i],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
