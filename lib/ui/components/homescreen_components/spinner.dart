import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noob/ui/utils/constants.dart';

final spinkit = Column(
  children: [
    SpinKitThreeBounce(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
              color: index.isEven ? kblue : Colors.white,
              shape: index.isEven ? BoxShape.circle : BoxShape.circle),
        );
      },
    ),
    Text(
      'Loading Content...',
      style: ktitleMedium,
    )
  ],
);
