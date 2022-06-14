import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/widgets/widgets.dart';

class UserInfoWidget extends StatelessWidget {
  final User userData;

  const UserInfoWidget({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailPage(userData: userData),
          ),
        );
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
