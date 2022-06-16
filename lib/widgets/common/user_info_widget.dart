import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class UserInfoWidget extends StatelessWidget {
  final User userData;
  final bool tap;

  const UserInfoWidget({
    super.key,
    required this.userData,
    this.tap = true,
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
            const SizedBox(width: 18),
            SizedBox(
              height: 40,
              child: carryImageWidget(
                url: userData.smallProfileImage!,
                radius: 100,
                height: 40,
              ),
            ),
            const SizedBox(width: 18),
            Flexible(
              flex: 1,
              child: CustomText(
                text: userData.userName!,
                textColor: theme.textColor!,
                alignment: Alignment.bottomLeft,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
