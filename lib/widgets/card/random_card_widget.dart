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
                height: 480,
                child: GestureDetector(
                  onTap: () {
                    // photoDetailDialog(
                    //   context: context,
                    //   photoData: data,
                    //   theme: theme,
                    // );
                    provider.setImageUrl(url: data.urls!.regularUrl!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailPage(data: data),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      carryImageWidget(
                        url: data.urls!.regularUrl ?? '',
                        boxFit: BoxFit.cover,
                        height: 480,
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
                profileImageSize: 30,
                userNameTextSize: 13,
              ),
            )
          ],
        );
      },
    );
  }
}
