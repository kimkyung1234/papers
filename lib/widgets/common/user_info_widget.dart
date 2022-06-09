import 'package:flutter/material.dart';
import 'package:papers/models/user_model.dart';
import 'package:papers/widgets/common/carry_image_widget.dart';
import 'package:papers/widgets/common/custom_text.dart';

class UserInfoWidget extends StatelessWidget {
  final User userData;

  const UserInfoWidget({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        CustomText(
          text: userData.userName!,
          fontSize: 17,
        )
      ],
    );
  }
}
