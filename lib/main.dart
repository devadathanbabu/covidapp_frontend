import 'package:covidapp/pages/menu.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(HomePage());
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MenuPage()
    );
  }
}
