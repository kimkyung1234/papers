import 'package:flutter/material.dart';
import 'package:papers/widgets/card/random_card_widget.dart';
import 'package:papers/widgets/common/custom_text.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
