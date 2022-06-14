import 'package:flutter/material.dart';
import 'package:papers/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: HomeListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
