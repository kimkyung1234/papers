// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papers/models/models.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class StaggeredGridListWidget extends StatelessWidget {
  final List<dynamic> dataList;
  final int itemCount;
  final bool tap;
  final bool tapUser;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  StaggeredGridListWidget({
    super.key,
    required this.dataList,
    required this.itemCount,
    this.tap = true,
    this.tapUser = true,
    this.controller,
    this.physics,
    this.shrinkWrap = false,
  });

  PhotoApiHelper photoApiHelper = PhotoApiHelper();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var imageFit = Provider.of<SettingProvider>(context);
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;
    bool isFilled = imageFit.getImageFit == 'Filled';

    int crossAxisCount;

    if (MediaQuery.of(context).size.width > 600) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }

    return MasonryGridView.count(
      physics: physics,
      shrinkWrap: shrinkWrap,
      controller: controller,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: isFilled ? 0 : 10,
      mainAxisSpacing: isFilled ? 0 : 10,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        Photo data = dataList[index];

        return GestureDetector(
          onTap: () async {
            if (tap == true) {
              Photo photoData = await photoApiHelper.getPhotoById(
                  context: context, id: data.id!);

              provider.setImageUrl(url: photoData.urls!.regularUrl!);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailPage(
                    data: photoData,
                    tap: tapUser,
                  ),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius:
                    BorderRadius.all(Radius.circular(isFilled ? 0 : 15))),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(isFilled ? 0 : 15)),
              child: carryImageWidget(
                url: data.urls!.smallUrl ?? '',
                boxFit: BoxFit.fitHeight,
                height: 200,
                radius: isFilled ? 0 : 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
