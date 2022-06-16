import 'package:flutter/cupertino.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

class CircularIndicatorWidget extends StatelessWidget {
  final double height;

  const CircularIndicatorWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return SizedBox(
      height: height,
      child: Center(
        child: CupertinoActivityIndicator(
          color: theme.textColor,
        ),
      ),
    );
  }
}
