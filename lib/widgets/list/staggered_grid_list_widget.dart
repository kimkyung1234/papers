import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class StaggeredGridListWidget extends StatelessWidget {
  final List<dynamic> dataList;
  final int itemCount;
  final bool tap;
  final bool tapUser;
  final ScrollController? controller;

  StaggeredGridListWidget({
    super.key,
    required this.dataList,
    required this.itemCount,
    this.tap = true,
    this.tapUser = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return MasonryGridView.count(
      controller: controller,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        Photo data = dataList[index];

        return GestureDetector(
          onTap: () {
            if (tap == true) {
              photoDetailDialog(
                context: context,
                photoData: data,
                tap: tapUser,
                theme: theme,
              );
            }
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: carryImageWidget(
                url: data.urls!.smallUrl ?? '',
                boxFit: BoxFit.fitHeight,
                height: 200,
              ),
            ),
          ),
        );
      },
    );
  }
}
