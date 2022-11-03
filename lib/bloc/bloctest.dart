import 'package:bloc/bloc.dart';

class Counterevent {}

class Increment extends Counterevent {}

class Decrement extends Counterevent {}

class Changed extends Counterevent {}

class Counterbloc extends Bloc<Counterevent, int> {
  Counterbloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 2));
    on<Decrement>((event, emit) => emit(state - 3));
  }
}

class Changevent {}

class Up extends Changevent {}

class Down extends Changevent {}

class Changebloc extends Bloc<Changevent, bool> {
  Changebloc() : super(false) {
    on<Up>((event, emit) => emit(true));
    on<Down>((event, emit) => emit(false));
  }
}
