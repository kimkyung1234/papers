import 'package:flutter/material.dart';
import 'package:papers/widgets/widgets.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconTextWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Icon(
          icon,
          color: Colors.grey,
          size: 18,
        ),
        CustomText(
          text: text,
          fontSize: 12,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15, right: 5),
        ),
      ],
    );
  }
}
