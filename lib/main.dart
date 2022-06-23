import 'package:doviz_yorum/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/utils/constants.dart';
import 'core/utils/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primary, // primary color status bar
      statusBarIconBrightness: Brightness.light // dark text for status bar
      ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Döviz Yorum',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      home: const RouterPage(),
    );
  }
}
