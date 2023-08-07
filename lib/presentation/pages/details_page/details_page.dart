import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/db_helper.dart';
import 'package:todo_app/core/utils/utils.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Something',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Something and something',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AppUtils.kHeight20,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: Colors.white,
                        ),
                        Text(
                          '15:00 -16:00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    AppUtils.kHeight10,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          'Tashkent',
                          style: TextStyle(color: Colors.white),
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    AppUtils.kHeight10,
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex sit amet neque dignissim mattis non eu est. Etiam pulvinar est mi, et porta magna accumsan nec. Ut vitae urna nisl. Integer gravida sollicitudin massa, ut congue orci posuere sit amet. Aenean laoreet egestas est, ut auctor nulla suscipit non. ',
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
                DBHelper.delete('b52c3');
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
