import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BottomPanelWidget extends StatelessWidget {
  final Photo data;

  const BottomPanelWidget({
    super.key,
    required this.data,
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
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerLeft,
            child: UserInfoWidget(userData: data.user!),
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
