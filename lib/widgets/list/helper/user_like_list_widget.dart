import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';

class UserLikeListWidget extends StatefulWidget {
  final User userData;

  const UserLikeListWidget({super.key, required this.userData});

  @override
  // ignore: library_private_types_in_public_api
  _UserLikeListWidgetState createState() => _UserLikeListWidgetState();
}

class _UserLikeListWidgetState extends State<UserLikeListWidget> {
  late ScrollController _controller;

  final List<Photo> _photoDataList = [];

  int index = 1;

  Future<void> fetchImages() async {
    PhotoApiHelper photoApiHelper = PhotoApiHelper();
    PhotosList a = await photoApiHelper.getUsersLikes(
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
    if (widget.userData.totalLikes == 0) {
      return const Center(child: CustomText(text: 'No Likes'));
    }
    return StaggeredGridListWidget(
      dataList: _photoDataList,
      itemCount: _photoDataList.length,
      controller: _controller,
    );
  }
}
