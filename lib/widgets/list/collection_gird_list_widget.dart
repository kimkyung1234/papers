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

  const CollectionGridListWidget({
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

    double collectionCoverImageSize;
    double mainAxisExtent;
    double collectionTextSize;

    if (MediaQuery.of(context).size.width > 600) {
      collectionCoverImageSize = 400;
      mainAxisExtent = 470;
      collectionTextSize = 20;
    } else {
      collectionCoverImageSize = 200;
      mainAxisExtent = 250;
      collectionTextSize = 14;
    }

    return GridView.builder(
      shrinkWrap: shrinkWrap,
      controller: controller,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: mainAxisExtent,
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
                  height: collectionCoverImageSize,
                  width: double.infinity,
                  child: carryImageWidget(
                    url: data.coverPhoto!.urls!.regularUrl!,
                    boxFit: BoxFit.cover,
                    radius: 5,
                    height: collectionCoverImageSize,
                  ),
                ),
                CustomText(
                  text: data.title!,
                  fontSize: collectionTextSize,
                  textColor: theme.textColor!,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  alignment: Alignment.centerLeft,
                ),
                CustomText(
                  text: '${data.totalPhotos} photos',
                  fontSize: collectionTextSize,
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
