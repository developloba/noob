import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noob/bloc/allgamesblocs/allgames_event.dart';
import 'package:noob/bloc/this%20week%20bloc/thisweek_bloc.dart';
import 'package:noob/bloc/this%20week%20bloc/thisweek_event.dart';
import 'package:noob/data/models/gamemodel.dart';
import 'package:noob/ui/components/homescreen_components/spinner.dart';
import 'package:noob/ui/utils/constants.dart';

import '../../../bloc/this week bloc/thisweek_state.dart';

class Thisweek extends StatefulWidget {
  const Thisweek({super.key});

  @override
  State<Thisweek> createState() => _ThisweekState();
}

class _ThisweekState extends State<Thisweek> {
  @override
  void initState() {
    BlocProvider.of<Thisweekbloc>(context).add(Getgamesevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Thisweekbloc, Thisweekstate>(
      builder: (context, state) {
        if (state is Loadingstate) {
          return Center(child: spinkit);
        } else if (state is Loadedstate) {
          List<Gamemodel> gameData = state.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: gameData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                  crossAxisCount: 3),
              itemBuilder: ((context, index) => Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 200,
                            child: Image.network(
                              gameData[index].image,
                              fit: BoxFit.fill,
                              width: 400,
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              right: 30,
                              child: TextButton(
                                onPressed: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.black45,
                                      shape: BoxShape.circle),
                                  width: 50,
                                  height: 50,
                                  child: const Icon(Icons.add),
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          gameData[index].name,
                          style: kDatafont,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white30,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        gameData[index].rating.toString(),
                                        style: kDatafontsmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))),
            ),
          );
        } else if (state is Errorstate) {
          return Text(state.error);
        } else {
          return Container();
        }
      },
    );
  }
}
