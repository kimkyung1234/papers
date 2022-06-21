import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatelessWidget {
  final User userData;

  UserDetailPage({super.key, required this.userData});

  PhotoApiHelper photoApiHelper = PhotoApiHelper();

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;
    var imageFit = Provider.of<SettingProvider>(context);
    bool isFilled = imageFit.getImageFit == 'Filled';

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: themeMode.getThemeDark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          elevation: 0,
          leadingWidth: 85,
          leading: IconButton(
            splashRadius: 28,
            icon: Icon(
              Icons.arrow_back_ios,
              color: theme.textColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 120,
              alignment: Alignment.center,
              child: carryImageWidget(
                url: userData.largeProfileImage!,
                height: 120,
                radius: 100,
              ),
            ),
            const SizedBox(height: 18),
            CustomText(
              text: userData.userName!,
              textColor: theme.textColor!,
              fontSize: 25,
            ),
            SizedBox(
              height: 70,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: const SizedBox(),
                bottom: TabBar(
                  labelColor: theme.textColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: theme.textColor,
                  tabs: [
                    Tab(text: 'Photos ${userData.totalPhotos}'),
                    Tab(text: 'Likes ${userData.totalLikes}'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: isFilled
                        ? const EdgeInsets.only(top: 10)
                        : const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: UserPhotoListWidget(
                      userData: userData,
                    ),
                  ),
                  Padding(
                    padding: isFilled
                        ? const EdgeInsets.only(top: 10)
                        : const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: UserLikeListWidget(
                      userData: userData,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
