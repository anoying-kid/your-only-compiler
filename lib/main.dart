import 'package:flutter/material.dart';
import 'package:pandey_app/screen/request_screen.dart';
import 'package:pandey_app/screen/tabs_screen.dart';
import 'widget/main_screen_widget.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => TabsScreen(),
        RequestScreen.routeName:(context) => RequestScreen(),
      },
      // home: MainScreen(),
    );
  }
}
