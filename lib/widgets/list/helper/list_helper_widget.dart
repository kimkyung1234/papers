import 'package:flutter/material.dart';
import 'package:papers/models/photos_list_model.dart';
import 'package:papers/widgets/common/indicator_widget.dart';
import 'package:papers/widgets/list/grid_list_widget.dart';

class ListHelperWidget extends StatelessWidget {
  final Future<PhotosList> future;

  const ListHelperWidget({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PhotosList>(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: circularIndicatorWidget(height: 100));
        }
        // else if (snapshot.data == null) {
        //   return Center(child: circularIndicatorWidget(height: 100));
        // }

        return GridListWidget(
          dataList: snapshot.data!.photos!,
          itemCount: snapshot.data!.photos!.length,
        );
      },
    );
  }
}
