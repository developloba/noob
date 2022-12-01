import 'package:equatable/equatable.dart';
import 'package:noob/data/models/gamemodel.dart';

abstract class Allgamestate extends Equatable {}

class Loadingstate extends Allgamestate {
  @override
  List<Object?> get props => [];
}

class Loadedstate extends Allgamestate {
  Loadedstate(this.data);
  final List<Gamemodel> data;
  @override
  List<Object?> get props => [data];
}

class Errorstate extends Allgamestate {
  Errorstate(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
