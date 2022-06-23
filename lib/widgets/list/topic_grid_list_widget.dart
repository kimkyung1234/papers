import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TopicGridListWidget extends StatelessWidget {
  final List<dynamic> dataList;
  final int itemCount;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  TopicGridListWidget({
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
    double topicTextSize;
    double profileImageSize;
    double userNameTextSize;

    if (MediaQuery.of(context).size.width > 600) {
      collectionCoverImageSize = 400;
      mainAxisExtent = 510;
      topicTextSize = 20;
      profileImageSize = 30;
      userNameTextSize = 17;
    } else {
      collectionCoverImageSize = 200;
      mainAxisExtent = 290;
      topicTextSize = 14;
      profileImageSize = 20;
      userNameTextSize = 12;
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
        Topic data = dataList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicDetailPage(
                  topicId: data.id!,
                  data: data,
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
                Stack(
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
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: statusWidget(status: data.status!),
                    ),
                  ],
                ),
                CustomText(
                  text: data.title!,
                  fontSize: topicTextSize,
                  textColor: theme.textColor!,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  alignment: Alignment.centerLeft,
                ),
                CustomText(
                  text: '${data.totalPhotos} photos',
                  fontSize: topicTextSize,
                  textColor: Colors.grey,
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 14),
                  alignment: Alignment.centerLeft,
                  overflow: TextOverflow.visible,
                ),
                UserInfoWidget(
                  userData: data.owner!,
                  leftPadding: 10,
                  profileImageSize: profileImageSize,
                  userNameTextSize: userNameTextSize,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
