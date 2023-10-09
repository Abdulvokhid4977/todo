import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/db_helper.dart';
import 'package:todo_app/core/utils/utils.dart';
import 'package:todo_app/data/models/events_model.dart';

class DetailsPage extends StatefulWidget {
  final EventsModel? eventsModel;
  const DetailsPage({super.key, this.eventsModel});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final events = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  color: Color(widget.eventsModel?.colorValue ?? 0xFF42A5F5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 14),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                            ),
                          ),
                        ),
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Edit',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    AppUtils.kHeight20,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.eventsModel?.name ?? '',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.eventsModel?.description ?? '',
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AppUtils.kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.access_time_filled,
                          color: Colors.white,
                        ),
                        Text(
                          widget.eventsModel?.eventDate ?? "",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    AppUtils.kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          widget.eventsModel?.location ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 100,
                padding: const EdgeInsets.only(top: 28, left: 28),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reminder',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    AppUtils.kHeight10,
                    Text(
                      '15 minutes before',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromRGBO(124, 123, 123, 1),
                      ),
                    ),
                  ],
                ),
              ),
              AppUtils.kHeight10,
              Container(
                alignment: Alignment.centerLeft,
                height: 300,
                padding: const EdgeInsets.only(top: 28, left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    AppUtils.kHeight10,
                    Text(
                      widget.eventsModel?.description ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(124, 123, 123, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          Container(
            height: 46,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colours.elevatedButtonColor,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                DBHelper.deleteItem(widget.eventsModel!.id);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              label: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Delete",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
