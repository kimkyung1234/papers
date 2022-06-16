import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papers/widgets/widgets.dart';

class CollectionDetailPage extends StatelessWidget {
  final String collectionId;
  final String title;

  const CollectionDetailPage({
    super.key,
    required this.collectionId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        leadingWidth: 85,
        leading: IconButton(
          splashRadius: 28,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: CollectionPhotoListWidget(
          collectionId: collectionId,
        ),
      ),
    );
  }
}
