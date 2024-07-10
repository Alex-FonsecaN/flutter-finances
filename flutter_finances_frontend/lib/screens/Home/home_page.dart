import 'package:flutter/material.dart';
import 'package:flutter_finances_frontend/screens/Home/home_body.dart';
import 'package:flutter_finances_frontend/screens/Home/home_bottom.dart';
//HOME PAGE BUILD
import 'home_upper.dart';
//import 'home_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          const HomeUpper(),
          const HomeBody(),
          const HomeBottom(sum: 1250.56)
        ],
      ),
    );
  }
}