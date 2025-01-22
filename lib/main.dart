import 'package:flutter/material.dart';

import '../widgets/routes.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertidas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.howItWorks,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
