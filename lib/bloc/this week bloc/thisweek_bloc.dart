import 'package:bloc/bloc.dart';
import 'package:noob/bloc/this%20week%20bloc/thisweek_event.dart';
import 'package:noob/bloc/this%20week%20bloc/thisweek_state.dart';
import 'package:noob/data/repository/thisweekrepository.dart';

class Thisweekbloc extends Bloc<Thisweekevent, Thisweekstate> {
  final Weeklyrepository repository;
  Thisweekbloc(this.repository) : super(Loadingstate()) {
    on<Getgamesevent>((event, emit) async {
      emit(Loadingstate());
      try {
        final data = await repository.getgames();
        emit(Loadedstate(data));
      } catch (e) {
        emit(Errorstate(e.toString()));
      }
    });
  }
}
