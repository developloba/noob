import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noob/bloc/allgamesblocs/allgames_bloc.dart';
import 'package:noob/bloc/allgamesblocs/allgames_event.dart';
import 'package:noob/ui/components/homescreen_components/appbar.dart';
import 'package:noob/ui/components/homescreen_components/tabview.dart';

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
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Tabbody(
                      control: controls,
                    ),
                  ],
                )),
              ],
            ),
          )),
    );
  }
}
