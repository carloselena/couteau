import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            _createDrawerItem(context, Icons.home, 'Portada', '/home'),
            Divider(),
            _createDrawerItem(context, Icons.person, 'Personajes', '/characters'),
            Divider(),
            _createDrawerItem(context, Icons.photo, 'Momentos', '/moments'),
            Divider(),
            _createDrawerItem(context, Icons.info, 'Acerca de', '/about'),
            Divider(),
            _createDrawerItem(context, Icons.person_2, 'En mi vida', '/personal'),
            Divider(),
            _createDrawerItem(context, Icons.work, 'Contrátame', '/hireMe'),
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
      Navigator.pop(context);
      Navigator.pushNamed(context, route);
    }
  );
}