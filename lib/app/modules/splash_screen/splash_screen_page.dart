import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../popular_people/popular_people_module.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Modular.to.navigate(PopularPeopleModule.initialRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Movie App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
      ),
    );
  }
}
