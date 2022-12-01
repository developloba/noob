import 'package:bloc/bloc.dart';
import 'package:noob/bloc/allgamesblocs/allgame_state.dart';
import 'package:noob/bloc/allgamesblocs/allgames_event.dart';
import 'package:noob/data/repository/gamerepository.dart';

class Allgamesbloc extends Bloc<Allgameevent, Allgamestate> {
  final Gamerepository repository;

  Allgamesbloc(this.repository) : super(Loadingstate()) {
    on<Loadingevent>((event, emit) async {
      emit(Loadingstate());
      try {
        final data = await repository.getGames();
        emit(Loadedstate(data));
      } catch (e) {
        emit(Errorstate(e.toString()));
      }
    });
  }
}
