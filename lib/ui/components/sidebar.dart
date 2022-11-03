import 'package:flutter/material.dart';
import 'package:noob/ui/utils/constants.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  List<String> sideinfo = ['Home', 'All games', 'Collection', 'Wishlist'];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 200,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  sideinfo[index],
                  style: ktitleMedium,
                ),
              ),
            )),
        physics: const BouncingScrollPhysics(),
        itemCount: sideinfo.length,
      ),
    );
  }
}
