import 'package:flutter/material.dart';
import 'package:papers/models/photo_model.dart';
import 'package:papers/services/photo_api.dart';
import 'package:papers/widgets/common/carry_image_widget.dart';
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

        final data = snapshot.data!.urls!.regularUrl;
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: Transform.scale(
                  scale: 0.9,
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        carryImageWidget(url: data ?? '', boxFit: BoxFit.cover),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
