import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noob/bloc/bloctest.dart';
import 'package:noob/ui/components/scaffold.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => Counterbloc())),
        BlocProvider(create: ((context) => Changebloc()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          home: const Base())));
}

Stream blocstream() async* {
  for (int i = 1; i <= 10; i++) {
    if (kDebugMode) {
      print('Sent$i');
    }
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}
