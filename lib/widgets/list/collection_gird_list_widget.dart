import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CollectionGridListWidget extends StatelessWidget {
  final List<dynamic> dataList;
  final int itemCount;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  CollectionGridListWidget({
    super.key,
    required this.dataList,
    required this.itemCount,
    this.controller,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return GridView.builder(
      shrinkWrap: shrinkWrap,
      controller: controller,
      physics: physics,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 250,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        Collection data = dataList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CollectionDetailPage(
                  collectionId: data.id!,
                  title: data.title!,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: carryImageWidget(
                    url: data.coverPhoto!.urls!.regularUrl!,
                    boxFit: BoxFit.cover,
                    radius: 5,
                    height: 150,
                  ),
                ),
                CustomText(
                  text: data.title!,
                  fontSize: 14,
                  textColor: theme.textColor!,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  alignment: Alignment.centerLeft,
                ),
                CustomText(
                  text: '${data.totalPhotos} photos',
                  fontSize: 14,
                  textColor: Colors.grey,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  alignment: Alignment.centerLeft,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
