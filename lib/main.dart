import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingProvider>(
            create: (_) => SettingProvider()),
        ChangeNotifierProvider<ThemeChangerProvider>(
            create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
        ChangeNotifierProvider<PageCountProvider>(
            create: (_) => PageCountProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);

    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        systemOverlayStyle: themeMode.getThemeDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      )),
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}
