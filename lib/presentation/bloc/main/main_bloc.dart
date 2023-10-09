import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {});
    on<CalendarNextMonthEvent>(_nextMonth);
    on<CalendarPreviousMonthEvent>(_previousMonth);
  }
  void _nextMonth(CalendarNextMonthEvent event, Emitter emit) {
    emit(
      CalendarMonthChangedState(
        DateTime(event.currentMonth.year, event.currentMonth.month + 1, 1),
      ),
    );
  }

  void _previousMonth(CalendarPreviousMonthEvent event, Emitter emit) {
    emit(
      CalendarMonthChangedState(
        DateTime(event.currentMonth.year, event.currentMonth.month - 1, 1),
      ),
    );
    // event.currentDate =
    //     DateTime(event.currentDate.year, event.currentDate.month - 1, 1);
  }
}
