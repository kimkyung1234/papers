import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SearchListWidget extends StatefulWidget {
  final String inputText;

  const SearchListWidget({super.key, required this.inputText});

  @override
  // ignore: library_private_types_in_public_api
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  late ScrollController _controller;

  final List<Photo> _photoDataList = [];

  int index = 1;

  Future<void> fetchImages() async {
    SearchApiHelper searchApiHelper = SearchApiHelper();
    SearchResult a = await searchApiHelper.getPhotosByText(
        page: index, inputText: widget.inputText);

    setState(() {
      // ignore: avoid_function_literals_in_foreach_calls
      a.results!.forEach((photoData) {
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
    var imageFit = Provider.of<SettingProvider>(context);
    bool isFilled = imageFit.getImageFit == 'Filled';

    if (_photoDataList.isEmpty) {
      return Center(
        child: CustomText(
          text: 'There is no information for \n "${widget.inputText}"',
          textColor: theme.textColor!,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Column(
      children: [
        CustomText(
          text: 'Result of "${widget.inputText}"',
          textColor: theme.textColor!,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: isFilled
                ? const EdgeInsets.all(0)
                : const EdgeInsets.only(left: 10, right: 10),
            child: StaggeredGridListWidget(
              dataList: _photoDataList,
              itemCount: _photoDataList.length,
              controller: _controller,
            ),
          ),
        ),
      ],
    );
  }
}
