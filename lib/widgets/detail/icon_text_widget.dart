import 'package:flutter/material.dart';
import 'package:papers/widgets/widgets.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final double iconSize;
  final Color textColor;
  final double textSize;

  const IconTextWidget({
    super.key,
    required this.text,
    required this.icon,
    this.iconSize = 18,
    required this.textColor,
    this.textSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Icon(
          icon,
          color: Colors.grey,
          size: iconSize,
        ),
        Flexible(
          child: CustomText(
            text: text,
            textColor: textColor,
            fontSize: textSize,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 15, right: 5),
            overflow: TextOverflow.fade,
          ),
        )
      ],
    );
  }
}
