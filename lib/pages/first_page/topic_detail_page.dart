import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TopicDetailPage extends StatelessWidget {
  final String topicId;
  final Topic data;

  const TopicDetailPage({
    super.key,
    required this.topicId,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: themeMode.getThemeDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        elevation: 0,
        leadingWidth: 85,
        leading: IconButton(
          splashRadius: 28,
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: TopicPhotoListWidget(
        topicId: topicId,
        data: data,
      ),
    );
  }
}
