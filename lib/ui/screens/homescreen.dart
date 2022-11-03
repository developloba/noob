import 'package:flutter/material.dart';
import 'package:noob/ui/components/tabbar.dart';
import 'package:noob/ui/components/tabview.dart';
import 'package:noob/ui/utils/constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 200;
    double bannerheight = MediaQuery.of(context).size.height / 1.5;
    TabController controls = TabController(vsync: this, length: 3);

    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.black,
        child: SizedBox(
          width: width,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Row(
                  children: [
                    SizedBox(
                      width: 400,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search 801,991 games',
                          hintStyle: const TextStyle(
                              fontFamily: 'plusjarkata', fontSize: 15),
                          filled: true,
                          prefixIcon: const Icon(Icons.search),
                          fillColor: const Color.fromARGB(61, 224, 224, 224),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(61, 224, 224, 224)),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(61, 224, 224, 224),
                            ),
                          ),
                        ),
                      ),
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
                      right: 100,
                      top: 100,
                      child: SizedBox(
                          height: 400,
                          width: 500,
                          child: RichText(
                            text: TextSpan(
                                text: 'Find your next favourite game',
                                style: ktitleLarge,
                                children: [
                                  TextSpan(
                                      text: ' here', style: ktitleLargeblue)
                                ]),
                          )),
                    )
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size(width, 0),
                  child: Noobbar(controls: controls),
                ),
              ),
              SliverToBoxAdapter(
                  child: SizedBox(
                      height: 1000,
                      width: width,
                      child: Tabbody(
                        control: controls,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

