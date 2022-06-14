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
    final provider = Provider.of<PageCountProvider>(context);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          leadingWidth: 85,
          leading: IconButton(
            splashRadius: 28,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
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
              fontSize: 25,
            ),
            SizedBox(
              height: 70,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text: 'Photos ${userData.totalPhotos}'),
                    Tab(text: 'Likes ${userData.totalLikes}'),
                    // const Tab(text: 'Rocket')
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: UserPhotoListWidget(
                      userData: userData,
                      tap: false,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: UserLikeListWidget(
                      userData: userData,
                      tap: false,
                    ),
                  ),
                  // Text('Tab 3'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
