import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PhotoDetailPage extends StatelessWidget {
  final Photo data;
  final bool tap;

  const PhotoDetailPage({super.key, required this.data, this.tap = true});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    double slidingUpPanelHeight;

    if (MediaQuery.of(context).size.width > 600) {
      slidingUpPanelHeight = 800;
    } else {
      slidingUpPanelHeight = 500;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: themeMode.getThemeDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        elevation: 0,
        leadingWidth: 85,
        leading: IconButton(
          splashRadius: 25,
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Icon(
              Icons.arrow_back_ios,
              color: theme.textColor!,
            ),
          ),
          onPressed: () {
            provider.reset();
            Navigator.pop(context);
          },
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white.withOpacity(0.3),
            child: PopupMenu(data: data),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: slidingUpPanelHeight,
        renderPanelSheet: false,
        panel: BottomPanelWidget(
          data: data,
          tap: tap,
        ),
        collapsed: _floatingCollapsed(theme),
        body: Stack(
          fit: StackFit.expand,
          children: [
            InteractiveViewer(
              minScale: 0.1,
              maxScale: 3,
              child: carryImageWidget(
                url: provider.getImageUrl!,
                boxFit: provider.getBoxFit,
                height: 480,
                radius: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _floatingCollapsed(ColorTheme theme) {
  return Container(
    decoration: BoxDecoration(
      color: theme.cardColor,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    ),
    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    child: const Center(
        child: Icon(
      Icons.keyboard_arrow_up,
      color: Colors.grey,
    )),
  );
}
