import 'package:flutter/material.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        RandomPage(controller: _controller),
        SafeArea(
          child: Column(
            children: [
              IconButton(
                splashRadius: 15,
                icon: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.grey,
                ),
                onPressed: () {
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
