import 'package:dog_breeds/config/AppRoute.dart';
import 'package:dog_breeds/config/Palette.dart';
import 'package:dog_breeds/config/ServiceLocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home/HomePage.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Breeds',
      navigatorKey: locator!<AppRoute>().navigatorKey,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          color: Palette.primaryColor,
        ),
      ),
      home: HomePage(),
    );
  }
}
