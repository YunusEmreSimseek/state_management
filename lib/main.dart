import 'package:flutter/material.dart';
import 'package:state_management/feature/travel/view/travel_tab_view.dart';
import 'package:state_management/product/utility/theme/my_dark_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyDarkTheme.theme,
      title: 'Material App',
      home: const TravelTabView(),
    );
  }
}
