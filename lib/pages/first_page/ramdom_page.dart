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
              text: 'Random Photo',
              textColor: theme.textColor!,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              fontWeight: FontWeight.bold,
            ),
            RandomCardWidget(),
            IconButton(
              splashRadius: 15,
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
