import 'package:flutter/material.dart';
import 'package:papers/models/photo_model.dart';
import 'package:papers/services/photo_api.dart';
import 'package:papers/widgets/common/carry_image_widget.dart';
import 'package:papers/widgets/common/custom_text.dart';
import 'package:papers/widgets/common/indicator_widget.dart';

class RandomCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Photo>(
      future: getRandomPhoto(),
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
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: carryImageWidget(
                        url: data.user!.smallProfileImage!,
                        radius: 100,
                        height: 40,
                      ),
                    ),
                    const SizedBox(width: 18),
                    CustomText(
                      text: data.user!.userName!,
                      fontSize: 17,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
