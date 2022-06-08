import 'package:flutter/material.dart';
import 'package:papers/providers/page_count_provider.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  final List<Widget> _children = const [
    Text(
      'first',
      style: TextStyle(fontFamily: 'Comfortaa'),
    ),
    Text(
      'home',
      style: TextStyle(fontFamily: 'Comfortaa'),
    ),
    Text(
      'search',
      style: TextStyle(fontFamily: 'Comfortaa'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PageCountProvider>(context);

    return Scaffold(
      body: Center(
        child: _children[provider.getCurrentIndex],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: provider.onTabTapped,
          currentIndex: provider.getCurrentIndex,
          selectedItemColor: Colors.black,
          elevation: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.filter_none,
                size: 18,
              ),
              label: 'Mission',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'MyPage',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
