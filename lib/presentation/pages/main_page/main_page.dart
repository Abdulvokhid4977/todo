import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/config/routes/app_routes.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/db_helper.dart';
import 'package:todo_app/data/models/events_model.dart';
import 'package:todo_app/presentation/pages/main_page/widgets/calendar.dart';
import 'package:todo_app/presentation/pages/main_page/widgets/event.dart';
import 'package:todo_app/presentation/pages/main_page/widgets/main_widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime selectedDate = DateTime.now();
  int today = DateTime.now().day;

  List<EventsModel> events = [];
  Future<void> getData() async {
    print('///////////////////////');
    final dbData = await DBHelper.getData('events');
    events = dbData
        .map((e) => EventsModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            createdAt: e['createdAt'],
            location: e['location'],
            colorValue: e['colorValue'],
            eventDate: e['eventDate']))
        .toList();
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
                        DateFormat.EEEE().format(
                          DateTime.now(),
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
                      DateFormat.MMMM().format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colours.blackCustom,
                      ),
                    ),
                    LRButtons(selectedDate),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 260,
            child: Calendar(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
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
            child: FutureBuilder(
              future: getData(),
              builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: 250,
                          child: ListView.builder(
                            itemCount: events.length,
                            itemBuilder: (_, int index) {
                              return EventTile(
                                events[index].name,
                                events[index].description,
                                events[index].colorValue,
                                events[index].location,
                                events[index].eventDate,
                              );
                            },
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
