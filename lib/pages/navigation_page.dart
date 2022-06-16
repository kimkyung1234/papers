import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  final List<Widget> _children = [
    FirstPage(),
    HomePage(),
    SearchPage(),
    CollectionPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PageCountProvider>(context);
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: themeMode.getThemeDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Center(
          child: _children[provider.getCurrentIndex],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            canvasColor: theme.backgroundColor,
          ),
          child: BottomNavigationBar(
            onTap: provider.onTabTapped,
            currentIndex: provider.getCurrentIndex,
            selectedItemColor: theme.textColor,
            unselectedItemColor: Colors.grey,
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
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  size: 21,
                ),
                label: 'collection',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  size: 20,
                ),
                label: 'setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
