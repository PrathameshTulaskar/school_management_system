import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/constants/textstyle_constant.dart';
import 'package:school_management_system/widgets/text_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}



class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _selectedDate = DateTime.now();
  List<DateTime> _absentDates = [
    DateTime(2023, 8, 15),
    DateTime(2023, 6, 15),
    DateTime(2023, 7, 25),
    DateTime(2023, 8, 15),
    DateTime(2023, 8, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMonthPicker(),
        _buildCalendar(),
        _buildAttendanceInfo(),
        daysCount()
      ],
    );
  }

  Widget _buildMonthPicker() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
              });
            },
          ),

          TextWidget(DateFormat('MMMM y').format(_selectedDate),TextStyleConstant.mediumFont),

          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    final int daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    final int firstWeekday = DateTime(_selectedDate.year, _selectedDate.month, 1).weekday;
    final double cellSpacing = 4.0; // Adjust the spacing as needed
    final List<Widget> calendarDays = [];
    final List<String> weekdayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    // Define your color scheme
    ColorScheme colorScheme = ColorScheme.light(primary: Colors.blue);

    // Adding weekday names row with color scheme
    calendarDays.addAll(
      weekdayNames.map(
            (weekdayName) => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(weekdayName, style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.primary)),
        ),
      ),
    );

    for (int i = 0; i < daysInMonth + firstWeekday; i++) {
      if (i >= firstWeekday) {
        DateTime day = DateTime(_selectedDate.year, _selectedDate.month, i - firstWeekday + 1);
        bool isAbsent = _absentDates.contains(day);
        bool isCurrentDate = day.year == DateTime.now().year && day.month == DateTime.now().month && day.day == DateTime.now().day;

        calendarDays.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = day;
              });
            },
            child: Container(
              margin: EdgeInsets.all(cellSpacing), // Add spacing here
              decoration: BoxDecoration(
                color: isAbsent ? Colors.red : (isCurrentDate ? Colors.blue : colorScheme.background),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                (i - firstWeekday + 1).toString(),
                style: TextStyle(
                  color: isAbsent || isCurrentDate ? Colors.white : colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      } else {
        calendarDays.add(Container()); // Empty container for days before the 1st
      }
    }

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 7,
      physics: NeverScrollableScrollPhysics(),
      children: calendarDays,
    );
  }

  Widget _buildAttendanceInfo() {
    final DateFormat formatter = DateFormat('MMM d, y');
    final selectedDateFormatted = formatter.format(_selectedDate);
    final attendanceStatus = _absentDates.contains(_selectedDate) ? 'Absent' : 'Present';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }

  Widget daysCount(){
     return Row(
       mainAxisAlignment:MainAxisAlignment.spaceBetween,
       children: [
         Container(
           padding: EdgeInsets.all(20),
           decoration: BoxDecoration(
           color: Colors.red,
             borderRadius: BorderRadius.all(Radius.circular(10))
           ),
           child: Column(
             children: [
               TextWidget("Absent Day's", TextStyleConstant.largeFont.copyWith(fontSize: 24,color: Colors.white)),
               TextWidget("05", TextStyleConstant.largeFont.copyWith(fontSize: 24,color: Colors.white)),
             ],
           ),
         ),
         Container(
           padding: EdgeInsets.all(20),
           decoration: BoxDecoration(
           color: Colors.green,
             borderRadius: BorderRadius.all(Radius.circular(10))
           ),
           child: Column(
             children: [
               TextWidget("Present Day's", TextStyleConstant.largeFont.copyWith(fontSize: 24,color: Colors.white)),
               TextWidget("25", TextStyleConstant.largeFont.copyWith(fontSize: 24,color: Colors.white)),
             ],
           ),
         ),
       ],
     );
  }
}









