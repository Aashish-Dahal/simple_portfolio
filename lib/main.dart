import 'package:flutter/material.dart';

import 'screens/myPortfolio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPortfolioPage(title: 'CodeIsh'),
    );
  }
}
