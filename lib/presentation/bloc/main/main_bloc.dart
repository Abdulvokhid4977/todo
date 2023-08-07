import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PreviousMonth>(_previousMonth);
  }
  void _previousMonth(PreviousMonth event, Emitter<MainState> emit) {
    event.currentDate =
        DateTime(event.currentDate.year, event.currentDate.month - 1, 1);
  }
}
