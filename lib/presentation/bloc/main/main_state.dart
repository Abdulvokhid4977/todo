part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {}

class MainInitial extends MainState {
  @override
  List<Object?> get props => [];
}
class CalendarMonthChangedState extends MainState {
  final DateTime currentMonth;

  CalendarMonthChangedState(this.currentMonth);

  @override
  List<Object?> get props => [currentMonth];
}
