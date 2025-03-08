import 'package:couteau/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            _createDrawerItem(context, Icons.home, 'Inicio', '/'),
            Divider(),
            _createDrawerItem(context, Icons.male, 'Género', GenderScreen.uri),
            Divider(),
            _createDrawerItem(context, Icons.people, 'Edad', AgeScreen.uri),
            Divider(),
            _createDrawerItem(context, Icons.school, 'Universidades', CountryUniversitiesScreen.uri),
            Divider(),
            _createDrawerItem(context, Icons.sunny, 'Clima en RD', WeatherScreen.uri),
            Divider(),
            _createDrawerItem(context, Icons.catching_pokemon, 'Pokédex', PokemonScreen.uri),
            Divider(),
            _createDrawerItem(context, Icons.wordpress, 'Página de WordPress', WordPressScreen.uri),
            Divider(),
            _createDrawerItem(context, Icons.work, 'Acerca de', AboutMeScreen.uri),
          ],
        ),
      );
  }
}

Widget _createDrawerItem(BuildContext context, IconData icon, String itemText, String route) {
  return ListTile(
    leading: Icon(icon),
    title: Text(itemText),
    onTap: () {
      context.push(route);
      Navigator.pop(context);
    }
  );
}