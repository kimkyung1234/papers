import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/widgets/widgets.dart';

class ListHelperWidget extends StatelessWidget {
  final Future<PhotosList> future;
  final bool tap;

  const ListHelperWidget({
    super.key,
    required this.future,
    this.tap = true,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PhotosList>(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: circularIndicatorWidget(height: 100));
        }

        return GridListWidget(
          dataList: snapshot.data!.photos!,
          itemCount: snapshot.data!.photos!.length,
          tap: tap,
        );
      },
    );
  }
}
