import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';

class CollectionListWidget extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CollectionListWidgetState createState() => _CollectionListWidgetState();
}

class _CollectionListWidgetState extends State<CollectionListWidget> {
  late ScrollController _controller;

  final List<Collection> _collectoinList = [];

  int index = 1;

  Future<void> fetchImages() async {
    CollectionApiHelper collectionApiHelper = CollectionApiHelper();
    CollectionList a = await collectionApiHelper.getCollections(page: index);

    setState(() {
      // ignore: avoid_function_literals_in_foreach_calls
      a.collections!.forEach((photoData) {
        _collectoinList.add(photoData);
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
    return GridListWidget(
      dataList: _collectoinList,
      itemCount: _collectoinList.length,
      controller: _controller,
    );
  }
}
