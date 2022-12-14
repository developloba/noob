import 'package:flutter/material.dart';
import 'package:noob/ui/components/homescreen_components/this_week.dart';
import 'package:noob/ui/components/views.dart';

class Tabbody extends StatefulWidget {
  const Tabbody({super.key, required this.control});
  final TabController control;
  @override
  State<Tabbody> createState() => _TabbodyState();
}

class _TabbodyState extends State<Tabbody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3000,
      width: MediaQuery.of(context).size.width,
      child: TabBarView(
          clipBehavior: Clip.none,
          controller: widget.control,
          children: const [Thisweek(), Best(), Popular()]),
    );
  }
}
