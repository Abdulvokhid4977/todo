import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/utils.dart';
import 'package:todo_app/presentation/bloc/main/main_bloc.dart';

import '../../../../core/constants/constants.dart';

class LRButtons extends StatelessWidget {
  final DateTime currentDate;

  const LRButtons(this.currentDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (ctx, state) {
        return Row(
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
                  context.read<MainBloc>().add(
                        CalendarPreviousMonthEvent(currentDate),
                      );
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
                  context.read<MainBloc>().add(
                        CalendarNextMonthEvent(currentDate),
                      );
                },
                icon: const Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ],
        );
      },
    );
  }
}
