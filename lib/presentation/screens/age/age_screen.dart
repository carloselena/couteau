import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class AgeScreen extends StatelessWidget {

  static const String name = 'age_screen';
  static const String uri = '/age_screen';

  const AgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Navaja Suiza'),
      ),
      drawer: CustomDrawer(),
      body: Text('Age Screen'),
    );
  }
}