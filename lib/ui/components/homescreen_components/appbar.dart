import 'package:flutter/material.dart';
import 'package:noob/ui/components/homescreen_components/search.dart';
import 'package:noob/ui/components/homescreen_components/tabbar.dart';

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
        children: const [
          SizedBox(
            width: 400,
            height: 40,
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
        child: Noobbar(controls: controls),
      ),
    );
  }
}
