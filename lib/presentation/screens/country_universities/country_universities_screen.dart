import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class CountryUniversitiesScreen extends StatelessWidget {

  static const String name = 'country_universities_screen';
  static const String uri = '/country_universities_screen';

  const CountryUniversitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Navaja Suiza'),
      ),
      drawer: CustomDrawer(),
      body: Text('CountryUniversities Screen'),
    );
  }
}