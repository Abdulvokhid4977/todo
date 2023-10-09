import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/config/routes/app_routes.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/db_helper.dart';
import 'package:todo_app/core/utils/utils.dart';
import 'package:todo_app/data/models/events_model.dart';
import 'package:todo_app/presentation/bloc/main/main_bloc.dart';
import 'package:todo_app/presentation/pages/details_page/details_page.dart';
import 'package:todo_app/presentation/pages/main_page/widgets/calendar.dart';
import 'package:todo_app/presentation/pages/main_page/widgets/event.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime selectedDate = DateTime.now();
  DateTime changedTime= DateTime.now();
  DateTime? selectedMonth;
  int today = DateTime.now().day;

  List<EventsModel> events = [];
  Future<void> getData() async {
    final dbData = await DBHelper.getData('events');
    setState(() {
      events = dbData;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void _datePicker(DateTime selected) {
    showDatePicker(
      context: context,
      initialDate:
          selected != DateTime.now() ? selected : DateTime(2023, 8, today),
      firstDate: DateTime(1950, 1, 1),
      lastDate: DateTime(2950, 12, 31),
      currentDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(events);
    }
    return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 35),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat.EEEE().format(selectedDate,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colours.blackCustom,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _datePicker(selectedDate);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat("d MMMM y").format(
                                    selectedDate,
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colours.blackCustom,
                                  ),
                                ),
                                const Icon(Icons.expand_more)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat.MMMM().format(changedTime),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colours.blackCustom,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colours.lightGrey,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  _previousMonth();
                                  // context.read<MainBloc>().add(
                                  //   CalendarPreviousMonthEvent(selectedDate),
                                  // );
                                },
                                icon: const Icon(Icons.keyboard_arrow_left),
                              ),
                            ),
                            AppUtils.kWidth10,
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colours.lightGrey,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  _nextMonth();
                                  // context.read<MainBloc>().add(
                                  //   CalendarNextMonthEvent(selectedDate),
                                  // );
                                },
                                icon: const Icon(Icons.keyboard_arrow_right),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 260,
                child: Calendar(changedTime),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Schedule',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.add);
                      },
                      child: const Text('+ Add Event'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (_, i) {
                      return AppUtils.kHeight14;
                    },
                    itemCount: events.length,
                    itemBuilder: (_, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsPage(
                                eventsModel: events[index],
                              ),
                            ),
                          );
                        },
                        child: EventTile(
                          events[index].id,
                          events[index].name,
                          events[index].description,
                          events[index].colorValue,
                          events[index].location,
                          events[index].eventDate,
                        ),
                      );
                    }),
              ),
            ],
          ),
    );
  }
  void _previousMonth() {
    setState(() {
      changedTime = DateTime(changedTime.year, changedTime.month - 1, 1);
    });
  }
  void _nextMonth() {
    setState(() {
      changedTime = DateTime(changedTime.year, changedTime.month + 1, 1);
    });
  }
}

