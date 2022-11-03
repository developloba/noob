import 'package:flutter/material.dart';
import 'package:noob/ui/utils/constants.dart';

class Noobbar extends StatelessWidget {
  const Noobbar({
    Key? key,
    required this.controls,
  }) : super(key: key);

  final TabController controls;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: TabBar(
        controller: controls,
        indicatorWeight: 5,
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
        indicatorColor: kblue,
        tabs: const [
          Tab(text: 'This week'),
          Tab(text: 'Best of the year'),
          Tab(text: 'Popular in 2021')
        ],
        labelStyle: ktitleMedium,
      ),
    );
  }
}
