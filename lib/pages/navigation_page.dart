import 'package:flutter/material.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  final List<Widget> _children = [
    FirstPage(),
    HomePage(),
    SearchPage(),
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
              label: 'first',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
          ],
        ),
      ),
    );
  }
}
