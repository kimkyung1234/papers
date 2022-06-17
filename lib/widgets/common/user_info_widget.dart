import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class UserInfoWidget extends StatelessWidget {
  final User userData;
  final bool tap;
  final double leftPadding;
  final double profileImageSize;
  final double userNameTextSize;

  const UserInfoWidget({
    super.key,
    required this.userData,
    this.tap = true,
    this.leftPadding = 18,
    this.profileImageSize = 40,
    this.userNameTextSize = 17,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return GestureDetector(
      onTap: () {
        if (tap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailPage(userData: userData),
            ),
          );
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Row(
          children: [
            SizedBox(width: leftPadding),
            SizedBox(
              height: profileImageSize,
              child: carryImageWidget(
                url: userData.smallProfileImage!,
                radius: 100,
                height: profileImageSize,
              ),
            ),
            SizedBox(width: leftPadding),
            Flexible(
              flex: 1,
              child: CustomText(
                text: userData.userName!,
                textColor: theme.textColor!,
                alignment: Alignment.bottomLeft,
                fontSize: userNameTextSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
