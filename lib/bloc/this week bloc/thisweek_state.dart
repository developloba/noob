import 'package:equatable/equatable.dart';
import 'package:noob/data/models/gamemodel.dart';

class Thisweekstate extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loadingstate extends Thisweekstate {}

class Errorstate extends Thisweekstate {
  Errorstate(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}

class Loadedstate extends Thisweekstate {
  Loadedstate(this.data);
  final List<Gamemodel> data;

  @override
  List<Object?> get props => [data];
}
