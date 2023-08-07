import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/utils.dart';

import '../../../../core/constants/constants.dart';

class EventTile extends StatelessWidget {

  final String name;
  final String description;
  final int colorValue;
  final String location;
  final String eventDate;
  const EventTile(this.name, this.description, this.colorValue, this.location,
      this.eventDate, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colours.priorityBlue),
      child: Column(
        children: [
          ColoredBox(
            color: Color(colorValue),
            child: AppUtils.kHeight10,
          ),
           Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
           Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          AppUtils.kHeight10,
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.access_time_filled,
              ),
              Text(
                eventDate,
              ),
              AppUtils.kWidth10,
              const Icon(
                Icons.location_on,
              ),
              Text(
                location,
              ),
            ],
          ),
        ],
      ),
    );
  }


}
