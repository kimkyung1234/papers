import 'package:flutter/material.dart';
import 'package:papers/widgets/widgets.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            const CustomText(
              text: 'Random Photo',
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              fontWeight: FontWeight.bold,
            ),
            RandomCardWidget()
          ],
        ),
      ),
    );
  }
}
