import 'package:flutter/material.dart';

class MyDarkTheme {
  static final theme = ThemeData.dark().copyWith(
    tabBarTheme: const TabBarTheme(
      overlayColor: MaterialStatePropertyAll(Colors.black),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );
}
