import 'package:flutter/material.dart';
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
      height: 20,
      child: TabBarView(
          viewportFraction: 0.8,
          controller: widget.control,
          children: const [ThisWeek(), Best(), Popular()]),
    );
  }
}
