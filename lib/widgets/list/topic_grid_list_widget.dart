import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
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

    return GridView.builder(
      shrinkWrap: shrinkWrap,
      controller: controller,
      physics: physics,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 290,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        Topic data = dataList[index];

        return GestureDetector(
          onTap: () {},
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
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 14),
                  alignment: Alignment.centerLeft,
                  overflow: TextOverflow.visible,
                ),
                UserInfoWidget(
                  userData: data.owner!,
                  leftPadding: 10,
                  profileImageSize: 20,
                  userNameTextSize: 12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
