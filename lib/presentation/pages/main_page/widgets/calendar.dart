import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/utils.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _currentDate;
  int day = 1;
  int month = 8;
  int year = 2023;
  late int firstDayOfMonth;
  List<Widget> _buildWeekDays() {
    return List.generate(
      7,
      (index) => Center(
        child: Text(
          AppUtils.kWeekDays[index],
        ),
      ),
    );
  }

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
    });
  }

  List<Widget> _buildCalendarDays() {
    List<Widget> days = [];

    DateTime firstDayOfMonth =
        DateTime(_currentDate.year, _currentDate.month, 1);
    int daysInMonth =
        DateTime(_currentDate.year, _currentDate.month + 1, 0).day;

    int weekDay = firstDayOfMonth.weekday;
    int currentDay = 1;
    debugPrint(weekDay.toString());
    if (weekDay != 7) {
      for (int i = 0; i < weekDay; i++) {
        days.add(Container());
      }
    }
    for (int i = 0; i < daysInMonth; i++) {
      days.add(
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            child: Text(
              '$currentDay',
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      );
      currentDay++;
    }

    return days;
  }

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    firstDayOfMonth = DateTime(year, month, day).weekday;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: GridView.count(
            childAspectRatio: 32 / 20,
            crossAxisCount: 7,
            children: _buildWeekDays(),
          ),
        ),
        Expanded(
          flex: 4,
          child: GridView.count(
            childAspectRatio: 32 / 18,
            crossAxisCount: 7,
            children: _buildCalendarDays(),
          ),
        ),
      ],
    );
  }
}
