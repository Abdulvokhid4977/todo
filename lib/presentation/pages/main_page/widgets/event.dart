
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/utils.dart';

class EventTile extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final int colorValue;
  final String location;
  final String eventDate;
  const EventTile(this.id, this.name, this.description, this.colorValue,
      this.location, this.eventDate,
      {super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint(colorValue.toString());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      height: 101,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(colorValue).withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color(colorValue),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 12, left: 12),
            child: Text(
              name,
              style: TextStyle(
                color: Color(colorValue).withOpacity(0.9),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              description,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: Color(colorValue).withOpacity(0.9),
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          AppUtils.kHeight10,
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  color: Color(colorValue),
                  Icons.access_time_filled,
                ),
                Text(
                  eventDate,
                  style: TextStyle(
                    color: Color(colorValue),
                  ),
                ),
                AppUtils.kWidth10,
                Icon(
                  color: Color(colorValue),
                  Icons.location_on,
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Color(colorValue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
