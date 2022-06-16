import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/widgets/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

Future<void> photoDetailDialog({
  required BuildContext context,
  required Photo photoData,
  required ColorTheme theme,
  bool tap = true,
}) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInfoWidget(
                    userData: photoData.user!,
                    tap: tap,
                  ),
                  Row(
                    children: [
                      FlatButton(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                        ),
                        minWidth: 5,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: theme.textColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: carryImageWidget(
                        url: photoData.urls!.regularUrl!,
                        boxFit: BoxFit.cover,
                        radius: 0,
                        height: 600,
                      ),
                    ),
                    photoData.exif == null
                        ? const SizedBox()
                        : Column(children: [
                            const SizedBox(height: 20),
                            PhotoInfoWidget(photoData: photoData),
                          ]),
                    const SizedBox(height: 20),
                    IconTextWidget(
                      text:
                          'Created on ${DateFormat.yMMMd().format(DateTime.parse(photoData.createdDate!))}',
                      textColor: theme.textColor!,
                      icon: Icons.calendar_month,
                    ),
                    photoData.description == null
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 25),
                            child: Text(
                              photoData.description!,
                              style: const TextStyle(fontFamily: 'Comfortaa'),
                            )),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    },
  );
}
