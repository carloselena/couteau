import 'package:couteau/config/helpers/country_universities_api/get_universities_answer.dart';
import 'package:couteau/infrastructure/models/country_universities/country_universities_model.dart';
import 'package:flutter/material.dart';

class CountryUniversitiesForm extends StatefulWidget {

  const CountryUniversitiesForm({
    super.key,
  });
  

  @override
  State<CountryUniversitiesForm> createState() => _CountryUniversitiesFormState();
}

class _CountryUniversitiesFormState extends State<CountryUniversitiesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  List<University>? universitiesList;
  String? countryName;
  String validator = '';
  bool isLoading = false;

  void _processText() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      countryName = _textController.text;
      universitiesList = await GetUniversitiesAnswer(countryName: countryName!).getAnswer();
      validator = 'x';

      setState(() {
        isLoading = false;
      });
    }
  }

  _CountryUniversitiesFormState();

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ingrese un país en inglés',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color.secondary)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: 'País', border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el páís.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  child: ElevatedButton(
                    onPressed: _processText,
                    child: isLoading ? CircularProgressIndicator(color: color.primary, strokeWidth: 2,) : Text('Enviar'),
                  ),
                ),
                if (validator.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Universidades de $countryName:'.toUpperCase(),
                      style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: color.tertiary
                      )
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: universitiesList!.length,
                      itemBuilder: (context, index) {
                        final university = universitiesList![index];
                                
                        return Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  'Nombre: ${university.name}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: color.primary
                                  )
                                ),
                            
                                Text(
                                  'Dominios:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: color.secondary
                                  )
                                ),
                                for (int i = 0; i < university.domains.length; i++) ...[
                                  Text(
                                    university.domains[i],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: color.primary
                                    )
                                  ),
                                ],
                            
                                Text(
                                  'Páginas Web:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: color.secondary
                                  )
                                ),
                            
                                for (int i = 0; i < university.webPages.length; i++) ...[
                                  Text(
                                    university.domains[i],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: color.primary
                                    )
                                  ),
                                ],
                              ],
                            ),
                          )
                        );
                      }
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}