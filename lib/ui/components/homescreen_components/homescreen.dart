import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noob/bloc/allgamesblocs/allgame_state.dart';
import 'package:noob/bloc/allgamesblocs/allgames_bloc.dart';
import 'package:noob/bloc/allgamesblocs/allgames_event.dart';
import 'package:noob/data/models/gamemodel.dart';
import 'package:noob/ui/components/homescreen_components/appbar.dart';
import 'package:noob/ui/components/homescreen_components/spinner.dart';
import 'package:noob/ui/components/homescreen_components/tabview.dart';

import 'package:noob/ui/utils/constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  @override
  void initState() {
    BlocProvider.of<Allgamesbloc>(context).add(Loadingevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 200;
    double bannerheight = MediaQuery.of(context).size.height / 1.25;
    TabController controls = TabController(vsync: this, length: 3);

    return DefaultTabController(
      length: 3,
      child: Container(
          color: Colors.black,
          child: SizedBox(
            width: width,
            child: CustomScrollView(
              slivers: [
                Appbar(
                    bannerheight: bannerheight,
                    width: width,
                    controls: controls),
                SliverToBoxAdapter(
                    child: SizedBox(
                        height: 8000,
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Tabbody(
                              control: controls,
                            ),
                            BlocBuilder<Allgamesbloc, Allgamestate>(
                              builder: (context, state) {
                                if (state is Loadingstate) {
                                  return Center(child: spinkit);
                                } else if (state is Loadedstate) {
                                  List<Gamemodel> gameData = state.data;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: gameData.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 20,
                                              crossAxisCount: 3),
                                      itemBuilder: ((context, index) => Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 200,
                                                child: Image.network(
                                                    gameData[index].image),
                                              ),
                                              Text(
                                                gameData[index].name,
                                                style: ktitleMedium,
                                              ),
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
                            )
                          ],
                        ))),
              ],
            ),
          )),
    );
  }
}
