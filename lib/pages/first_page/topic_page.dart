import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TopicPage extends StatelessWidget {
  final PageController controller;

  TopicPage({
    super.key,
    required this.controller,
  });

  final TopicApiHelper topicApiHelper = TopicApiHelper();

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                splashRadius: 15,
                icon: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.grey,
                ),
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CustomText(
                    text: 'Topics',
                    fontSize: 30,
                    textColor: theme.textColor!,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 7, top: 10, bottom: 12),
                  ),
                  CustomText(
                    text:
                        'Explore the world through topics of beautiful photos free to use',
                    fontSize: 15,
                    textColor: theme.textColor!,
                    padding: const EdgeInsets.only(left: 7, bottom: 17),
                    alignment: Alignment.centerLeft,
                    overflow: TextOverflow.visible,
                  ),
                  FutureBuilder<TopicList>(
                    future: topicApiHelper.getTopics(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularIndicatorWidget(height: 500));
                      }
                      return TopicGridListWidget(
                        dataList: snapshot.data!.topis!,
                        itemCount: snapshot.data!.topis!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
