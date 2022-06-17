import 'package:flutter/material.dart';
import 'package:papers/pages/pages.dart';

class FirstPage extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      key: const PageStorageKey('controller'),
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        RandomPage(controller: _controller),
        TopicPage(controller: _controller),
      ],
    );
  }
}
