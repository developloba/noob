import 'package:flutter/material.dart';
import 'package:noob/ui/components/homescreen_components/homescreen.dart';
import 'package:noob/ui/components/sidebar.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(
            child: Sidebar(),
          ),
          Homescreen()
        ],
      ),
    );
  }
}
