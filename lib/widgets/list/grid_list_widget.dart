import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papers/models/photo_model.dart';
import 'package:papers/providers/page_count_provider.dart';
import 'package:papers/widgets/common/carry_image_widget.dart';
import 'package:papers/widgets/common/indicator_widget.dart';
import 'package:papers/widgets/photo_detail_dialog.dart';
import 'package:provider/provider.dart';

class GridListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PageCountProvider>(context);
    var postLength = provider.getPostList.length;

    return FutureBuilder(
      future: provider.firstLoad(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: circularIndicatorWidget(height: 100));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              provider.loadMore();
            }
            return false;
          },
          child: MasonryGridView.count(
            key: const PageStorageKey<String>('controllerA'),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount: postLength,
            itemBuilder: (context, index) {
              Photo data = provider.getPostList[index];

              return GestureDetector(
                onTap: () {
                  photoDetailDialog(context: context, photoData: data);
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
          ),
        );
      },
    );
  }
}
