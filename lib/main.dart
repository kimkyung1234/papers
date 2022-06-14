import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PageCountProvider>(
            create: (_) => PageCountProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}
