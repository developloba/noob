import 'package:flutter/material.dart';
import 'package:noob/ui/components/sidebar.dart';
import 'package:noob/ui/screens/homescreen.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [Sidebar(), Homescreen()],
      ),
    );
  }
}
