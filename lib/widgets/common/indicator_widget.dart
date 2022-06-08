import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circularIndicatorWidget({required double height}) {
  return SizedBox(
    height: height,
    child: const Center(
      child: CupertinoActivityIndicator(
        color: Colors.black,
      ),
    ),
  );
}
