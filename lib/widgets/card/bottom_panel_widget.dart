import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BottomPanelWidget extends StatelessWidget {
  final Photo data;
  final bool tap;

  const BottomPanelWidget({
    super.key,
    required this.data,
    this.tap = true,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(20),
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 28),
          const Center(
              child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          )),
          const SizedBox(height: 25),
          Align(
            alignment: Alignment.centerLeft,
            child: UserInfoWidget(userData: data.user!, tap: tap),
          ),
          const SizedBox(height: 18),
          data.exif == null
              ? const SizedBox()
              : PhotoInfoWidget(photoData: data),
          const SizedBox(height: 18),
          IconTextWidget(
            text:
                'Created on ${DateFormat.yMMMd().format(DateTime.parse(data.createdDate!))}',
            textColor: theme.textColor!,
            icon: Icons.calendar_month,
          ),
          data.exif == null
              ? const SizedBox()
              : Column(
                  children: [
                    const SizedBox(height: 10),
                    IconTextWidget(
                      text: '${data.location!.title}',
                      textColor: theme.textColor!,
                      icon: Icons.pin_drop,
                    ),
                    data.location!.title! == 'No data' ||
                            data.location!.latitude == null
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: MapWidget(location: data.location!)),
                    const SizedBox(height: 10),
                    CameraInfoWidget(exif: data.exif!),
                  ],
                ),
          data.description == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Text(
                    data.description!,
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: theme.textColor!,
                    ),
                  )),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
