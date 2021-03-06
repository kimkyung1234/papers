import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';

class UserPhotoListWidget extends StatefulWidget {
  final User userData;

  const UserPhotoListWidget({super.key, required this.userData});

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
    return StaggeredGridListWidget(
      dataList: _photoDataList,
      itemCount: _photoDataList.length,
      controller: _controller,
      tapUser: false,
    );
  }
}
