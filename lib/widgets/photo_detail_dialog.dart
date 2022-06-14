import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/widgets/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

Future<void> photoDetailDialog(
    {required BuildContext context, required Photo photoData}) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInfoWidget(userData: photoData.user!),
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
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: 'views',
                              fontSize: 12,
                              textColor: Colors.grey,
                              padding: EdgeInsets.only(bottom: 5),
                            ),
                            CustomText(
                              text: photoData.views.toString(),
                              fontSize: 14,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: 'downloads',
                              fontSize: 12,
                              textColor: Colors.grey,
                              padding: EdgeInsets.only(bottom: 5),
                            ),
                            CustomText(
                              text: photoData.downloads.toString(),
                              fontSize: 14,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.pin_drop,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomText(
                            text: 'location: ${photoData.location!.title}',
                            fontSize: 12,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 15, right: 5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                          size: 18,
                        ),
                        CustomText(
                          text:
                              'Created on ${DateFormat.yMMMd().format(DateTime.parse(photoData.createdDate!))}',
                          fontSize: 12,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 15, right: 5),
                        ),
                      ],
                    ),
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
