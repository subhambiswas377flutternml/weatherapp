import 'package:flutter/material.dart';
import './mydata.dart';
import 'package:provider/provider.dart';
import './screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyData(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
