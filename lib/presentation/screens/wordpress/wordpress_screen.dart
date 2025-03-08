import 'package:couteau/config/helpers/wordpress_api/get_wordpress_answer.dart';
import 'package:couteau/infrastructure/models/wordpress/news_model.dart';
import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class WordPressScreen extends StatelessWidget {
  static const String name = 'wordpress_screen';
  static const String uri = '/wordpress_screen';

  const WordPressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Página de WordPress')),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'La Hermandad de la Sed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: color.secondary,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/wordpress/hermandad_de_la_sed.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Últimas noticias',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: color.primary,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: FutureBuilder<List<NewsModel>>(
                future: GetWordPressAnswer().getAnswer(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(strokeWidth: 2,),
                    ); // Indicador de carga
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error al cargar noticias"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No hay noticias disponibles"));
                  }
                      
                  List<NewsModel> newsList = snapshot.data!;
                      
                  return ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            newsList[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: color.secondary
                            )
                            ),
                          subtitle: Html(
                            data: newsList[index].content,
                            style: {
                              "img": Style(
                                width: Width(MediaQuery.of(context).size.width * 0.9),
                                height: Height.auto(), // Mantener proporción
                              ),
                              "p": Style(
                                fontSize: FontSize(16),
                                textAlign: TextAlign.justify
                              )
                            }
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
