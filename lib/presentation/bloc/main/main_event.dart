part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

class PreviousMonth extends MainEvent{
  late final DateTime currentDate;
  PreviousMonth(this.currentDate);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NextMonth extends MainEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
