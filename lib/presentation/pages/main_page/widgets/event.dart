import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/utils.dart';

import '../../../../core/constants/constants.dart';

class EventTile extends StatelessWidget {
  const EventTile({super.key});


  // final String name;
  // final String description;
  // final int colorValue;
  // final String location;
  // final String eventDate;
  // const EventTile(this.name, this.description, this.colorValue, this.location,
  //     this.eventDate, {super.key});
  @override
  Widget build(BuildContext context) {
    print('/////////////55555555//////////');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colours.priorityBlue),
      child: Column(
        children: [
          ColoredBox(
            color: Colours.priorityBlue,
            child: AppUtils.kHeight10,
          ),
           const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Default name',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
           const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'description',
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          AppUtils.kHeight10,
           const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.access_time_filled,
              ),
              Text(
                'eventDate',
              ),
              AppUtils.kWidth10,
              Icon(
                Icons.location_on,
              ),
              Text(
                'location',
              ),
            ],
          ),
        ],
      ),
    );
  }


}
