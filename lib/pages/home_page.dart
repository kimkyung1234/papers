import 'package:flutter/material.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageFit = Provider.of<SettingProvider>(context);
    bool isFilled = imageFit.getImageFit == 'Filled';

    return SafeArea(
      child: Padding(
        padding: isFilled
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: HomeListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
