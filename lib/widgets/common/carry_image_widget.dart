import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papers/widgets/common/indicator_widget.dart';

Widget carryImageWidget(
    {required String url,
    required double height,
    BoxFit boxFit = BoxFit.fitHeight,
    double radius = 20}) {
  return Image.network(
    url,
    fit: boxFit,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: SizedBox.fromSize(
            child: child,
          ),
        );
      }
      return Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
        child: Center(
          child: circularIndicatorWidget(height: height),
        ),
      );
    },
  );
}
