import 'package:flutter/material.dart';
import 'package:papers/providers/page_count_provider.dart';
import 'package:papers/widgets/common/indicator_widget.dart';
import 'package:papers/widgets/list/grid_list_widget.dart';
import 'package:provider/provider.dart';

class HomeListWidget extends StatelessWidget {
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
          child: GridListWidget(
            dataList: provider.getPostList,
            itemCount: postLength,
          ),
        );
      },
    );
  }
}
