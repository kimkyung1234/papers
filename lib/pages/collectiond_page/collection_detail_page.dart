import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CollectionDetailPage extends StatelessWidget {
  final String collectionId;
  final String title;

  const CollectionDetailPage({
    super.key,
    required this.collectionId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;
    var imageFit = Provider.of<SettingProvider>(context);
    bool isFilled = imageFit.getImageFit == 'Filled';

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
      body: Padding(
        padding: isFilled
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(left: 10, right: 10),
        child: CollectionPhotoListWidget(
          collectionId: collectionId,
        ),
      ),
    );
  }
}
