import 'package:flutter/material.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
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
            RandomCardWidget()
          ],
        ),
      ),
    );
  }
}
