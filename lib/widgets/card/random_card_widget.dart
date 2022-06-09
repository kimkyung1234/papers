import 'package:flutter/material.dart';
import 'package:papers/models/photo_model.dart';
import 'package:papers/services/photo_api.dart';
import 'package:papers/widgets/common/carry_image_widget.dart';
import 'package:papers/widgets/common/indicator_widget.dart';
import 'package:papers/widgets/common/user_info_widget.dart';

class RandomCardWidget extends StatelessWidget {
  PhotoApiHelper photoApiHelper = PhotoApiHelper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Photo>(
      future: photoApiHelper.getRandomPhoto(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return circularIndicatorWidget(height: 500);
        }

        final data = snapshot.data!;
        return Transform.scale(
          scale: 0.9,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 500,
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        carryImageWidget(
                          url: data.urls!.regularUrl ?? '',
                          boxFit: BoxFit.cover,
                          height: 500,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                UserInfoWidget(userData: data.user!),
              ],
            ),
          ),
        );
      },
    );
  }
}
