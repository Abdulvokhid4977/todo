part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {}

class MainInitial extends MainState {
  @override
  List<Object?> get props => [];
}

class NextMonthState extends MainState {
  final DateTime currentDate;
  NextMonthState(this.currentDate);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PreviousMonthState extends MainState {
  final DateTime currentDate;
  PreviousMonthState(this.currentDate);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
