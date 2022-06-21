import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class TopicPhotoListWidget extends StatefulWidget {
  final String topicId;
  final Topic data;

  const TopicPhotoListWidget({
    super.key,
    required this.topicId,
    required this.data,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TopicPhotoListWidgetState createState() => _TopicPhotoListWidgetState();
}

class _TopicPhotoListWidgetState extends State<TopicPhotoListWidget> {
  late ScrollController _controller;

  final List<Photo> _photoDataList = [];

  int index = 1;

  Future<void> fetchImages() async {
    TopicApiHelper topicApiHelper = TopicApiHelper();
    PhotosList a = await topicApiHelper.getTopicPhotos(
      page: index,
      id: widget.topicId,
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
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;
    var topic = widget.data;
    var imageFit = Provider.of<SettingProvider>(context);
    bool isFilled = imageFit.getImageFit == 'Filled';

    return ListView(
      controller: _controller,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: statusWidget(status: topic.status!),
        ),
        CustomText(
          text: topic.title!,
          fontSize: 30,
          textColor: theme.textColor!,
          alignment: Alignment.centerLeft,
          padding:
              const EdgeInsets.only(left: 17, top: 15, bottom: 14, right: 10),
        ),
        IconTextWidget(
          text:
              'Published at ${DateFormat.yMMMd().format(DateTime.parse(topic.publishedAt!))}',
          textColor: theme.textColor!,
          icon: Icons.calendar_month,
        ),
        CustomText(
          text: topic.description ?? '',
          fontSize: 15,
          textColor: theme.textColor!,
          padding:
              const EdgeInsets.only(left: 17, bottom: 17, top: 14, right: 10),
          alignment: Alignment.centerLeft,
          overflow: TextOverflow.visible,
        ),
        UserInfoWidget(
          userData: topic.owner!,
          leftPadding: 17,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: isFilled
              ? const EdgeInsets.all(0)
              : const EdgeInsets.only(left: 10, right: 10),
          child: StaggeredGridListWidget(
            dataList: _photoDataList,
            itemCount: _photoDataList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
