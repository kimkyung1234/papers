// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RandomCardWidget extends StatelessWidget {
  PhotoApiHelper photoApiHelper = PhotoApiHelper();

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;
    var provider = Provider.of<SettingProvider>(context);

    double randomCardImageSize;
    double profileImageSize;
    double userNameTextSize;

    if (MediaQuery.of(context).size.width > 600) {
      profileImageSize = 50;
      userNameTextSize = 20;
      randomCardImageSize = 700;
    } else {
      profileImageSize = 30;
      userNameTextSize = 13;
      randomCardImageSize = 480;
    }

    return FutureBuilder<Photo>(
      future: photoApiHelper.getRandomPhoto(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularIndicatorWidget(height: 500);
        }

        final data = snapshot.data!;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: SizedBox(
                height: randomCardImageSize,
                child: GestureDetector(
                  onTap: () async {
                    Photo photoData = await photoApiHelper.getPhotoById(
                        context: context, id: data.id!);

                    provider.setImageUrl(
                      url: photoData.urls!.regularUrl!,
                      type: 'medium',
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailPage(data: photoData),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      carryImageWidget(
                        url: data.urls!.regularUrl ?? '',
                        boxFit: BoxFit.cover,
                        height: randomCardImageSize,
                        radius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: UserInfoWidget(
                userData: data.user!,
                profileImageSize: profileImageSize,
                userNameTextSize: userNameTextSize,
              ),
            )
          ],
        );
      },
    );
  }
}
