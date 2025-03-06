import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class PokemonScreen extends StatelessWidget {

  static const String name = 'pokemon_screen';
  static const String uri = '/pokemon_screen';

  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Navaja Suiza'),
      ),
      drawer: CustomDrawer(),
      body: Text('Pokemon Screen'),
    );
  }
}