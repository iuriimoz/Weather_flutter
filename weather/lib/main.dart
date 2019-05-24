import 'package:flutter/material.dart';
import 'package:weather/assembly/master_assembly.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Super weather app",
      theme: ThemeData(primaryColor: Colors.green),
      home: MasterAssembly.sharedInstance.screensAssembly.citiesScreen(),
    );
  }
}
