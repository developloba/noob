import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noob/bloc/bloctest.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle titleMedium =
      const TextStyle(fontSize: 80, fontFamily: 'plusjarkata');
  TextStyle titleMediumblack = const TextStyle(
      fontSize: 80, fontFamily: 'plusjarkata', color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: BlocListener<Changebloc, bool>(
        listener: (context, state) {
          if (state == true) {
            Scaffold.of(context).showBottomSheet((context) => Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Center(
                    child: Text(
                      'Increased',
                      style: titleMediumblack,
                    ),
                  ),
                ));
          } else if (state == false) {
            Scaffold.of(context).showBottomSheet((context) => Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Center(
                    child: Text(
                      'Decreased',
                      style: titleMediumblack,
                    ),
                  ),
                ));
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
                onPressed: () async {
                  BlocProvider.of<Counterbloc>(context).add(Increment());
                  context.read<Changebloc>().add(Up());
                },
                child: const Icon(Icons.rocket_launch_rounded)),
            BlocBuilder<Counterbloc, int>(
              builder: (context, count) {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    count.toString(),
                    style: titleMedium,
                  ),
                );
              },
            ),
            FloatingActionButton(
                onPressed: () async {
                  context.read<Counterbloc>().add(Decrement());
                  context.read<Changebloc>().add(Down());
                },
                child: const Icon(Icons.auto_awesome)),
          ],
        ),
      )),
    );
  }
}
