import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/services/services.dart';
import 'package:papers/widgets/widgets.dart';

class RandomCardWidget extends StatelessWidget {
  PhotoApiHelper photoApiHelper = PhotoApiHelper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Photo>(
      future: photoApiHelper.getRandomPhoto(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularIndicatorWidget(height: 500);
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: UserInfoWidget(userData: data.user!),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
