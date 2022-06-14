import 'package:flutter/material.dart';
import 'package:papers/models/photo_model.dart';
import 'package:papers/models/photos_list_model.dart';
import 'package:papers/models/user_model.dart';
import 'package:papers/services/photo_api.dart';
import 'package:papers/widgets/list/grid_list_widget.dart';

class UserPhotoListWidget extends StatefulWidget {
  final User userData;
  final bool tap;

  const UserPhotoListWidget(
      {super.key, required this.userData, this.tap = false});

  @override
  // ignore: library_private_types_in_public_api
  _UserPhotoListWidgetState createState() => _UserPhotoListWidgetState();
}

class _UserPhotoListWidgetState extends State<UserPhotoListWidget> {
  late ScrollController _controller;

  final List<Photo> _photoDataList = [];

  int index = 1;

  Future<void> fetchImages() async {
    PhotoApiHelper photoApiHelper = PhotoApiHelper();
    PhotosList a = await photoApiHelper.getUsersPhotos(
        page: index, userName: widget.userData.userName!);

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
    return GridListWidget(
      dataList: _photoDataList,
      itemCount: _photoDataList.length,
      controller: _controller,
    );
  }
}
