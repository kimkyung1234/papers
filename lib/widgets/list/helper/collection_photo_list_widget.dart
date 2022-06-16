import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';

class CollectionPhotoListWidget extends StatefulWidget {
  final String collectionId;

  const CollectionPhotoListWidget({super.key, required this.collectionId});

  @override
  // ignore: library_private_types_in_public_api
  _CollectionPhotoListWidgetState createState() =>
      _CollectionPhotoListWidgetState();
}

class _CollectionPhotoListWidgetState extends State<CollectionPhotoListWidget> {
  late ScrollController _controller;

  final List<Photo> _photoDataList = [];

  int index = 1;

  Future<void> fetchImages() async {
    CollectionApiHelper collectionApiHelper = CollectionApiHelper();
    PhotosList a = await collectionApiHelper.getCollectionPhotos(
      page: index,
      id: widget.collectionId,
    );

    setState(() {
      // ignore: avoid_function_literals_in_foreach_calls
      a.photos!.forEach((photoData) {
        _photoDataList.add(photoData);
      });

      index++;
    });
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      fetchImages();
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    fetchImages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridListWidget(
      dataList: _photoDataList,
      itemCount: _photoDataList.length,
      controller: _controller,
    );
  }
}
