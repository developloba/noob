import 'package:flutter/material.dart';
import 'package:noob/ui/components/homescreen_components/search.dart';

import 'package:noob/ui/utils/constants.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    required this.bannerheight,
    required this.width,
    required this.controls,
  }) : super(key: key);

  final double bannerheight;
  final double width;
  final TabController controls;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          SizedBox(
            width: 400,
            height: 50,
            child: Search(),
          )
        ],
      ),
      collapsedHeight: bannerheight,
      flexibleSpace: Stack(
        children: [
          SizedBox(
            height: bannerheight,
            width: width,
            child: Image.asset(
              'assets/pictures/halo.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 100,
            top: 180,
            child: SizedBox(
                height: 400,
                width: 500,
                child: RichText(
                  text: TextSpan(
                      text: 'Find your next favourite game',
                      style: ktitleLarge,
                      children: [
                        TextSpan(text: ' here', style: ktitleLargeblue)
                      ]),
                )),
          )
        ],
      ),
      bottom: PreferredSize(
          preferredSize: Size(width, 0),
          child: Container(
            color: Colors.transparent,
            child: TabBar(
              controller: controls,
              indicatorWeight: 5,
              isScrollable: true,
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              indicatorColor: kblue,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: 'This week'),
                Tab(text: 'Best of the year'),
                Tab(text: 'Popular in 2021')
              ],
              labelStyle: ktitleMedium,
            ),
          )),
    );
  }
}
