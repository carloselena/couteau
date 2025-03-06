import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {

  static const String name = 'about_me_screen';
  static const String uri = '/about_me_screen';

  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Navaja Suiza'),
      ),
      drawer: CustomDrawer(),
      body: Text('AboutMe Screen'),
    );
  }
}