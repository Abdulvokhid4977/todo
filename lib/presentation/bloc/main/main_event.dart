part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}
class CalendarNextMonthEvent extends MainEvent {
  final DateTime currentMonth;
  CalendarNextMonthEvent(this.currentMonth);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CalendarPreviousMonthEvent extends MainEvent {
  final DateTime currentMonth;
  CalendarPreviousMonthEvent(this.currentMonth);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}