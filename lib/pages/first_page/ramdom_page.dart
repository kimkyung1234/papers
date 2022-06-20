import 'package:flutter/material.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RandomPage extends StatelessWidget {
  final PageController controller;

  const RandomPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            CustomText(
              text: 'Unsplash',
              textColor: theme.textColor!,
              fontSize: 35,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10, bottom: 8),
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: 'Powered by creators everywhere.',
              textColor: theme.textColor!,
              fontSize: 14,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 14),
              fontWeight: FontWeight.bold,
            ),
            Row(
              children: [
                Expanded(child: RandomCardWidget()),
                IconButton(
                  splashRadius: 15,
                  tooltip: '',
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              splashRadius: 15,
              tooltip: 'Topics',
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              onPressed: () {
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
