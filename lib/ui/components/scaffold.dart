import 'package:flutter/material.dart';
import 'package:noob/ui/screens/homescreen.dart';
import 'package:noob/ui/components/sidebar.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(
            flex: 1,
            child: Sidebar(),
          ),
          Expanded(
            flex: 4,
            child: Homescreen(),
          )
        ],
      ),
    );
  }
}
