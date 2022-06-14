import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papers/models/models.dart';
import 'package:papers/widgets/widgets.dart';

class GridListWidget extends StatelessWidget {
  final List<dynamic> dataList;
  final int itemCount;
  final bool tap;
  final ScrollController? controller;

  GridListWidget({
    super.key,
    required this.dataList,
    required this.itemCount,
    this.tap = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
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
              photoDetailDialog(context: context, photoData: data);
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
