import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {

  static const String name = 'weather_screen';
  static const String uri = '/weather_screen';

  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Navaja Suiza'),
      ),
      drawer: CustomDrawer(),
      body: Text('Weather Screen'),
    );
  }
}