import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {

  static const String name = 'about_me_screen';
  static const String uri = '/about_me_screen';

  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de Contacto'),
      ),
      drawer: CustomDrawer(),
      body: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Image.asset('assets/personal_image.jpg'),
            SizedBox(height: 10,),
            Text('Carlos Elena', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: color.primary)),
            Text('carloselenadev@gmail.com', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: color.primary)),
          ],
        )
      )
    );
  }
}