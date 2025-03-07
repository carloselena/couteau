import 'package:couteau/config/helpers/pokemon_api/get_pokemon_answer.dart';
import 'package:couteau/infrastructure/models/pokemon/pokemon_model.dart';
import 'package:flutter/material.dart';

class PokemonForm extends StatefulWidget {

  const PokemonForm({
    super.key,
  });
  

  @override
  State<PokemonForm> createState() => _PokemonFormState();
}

class _PokemonFormState extends State<PokemonForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  PokemonModel? pokemon;
  String validator = '';
  bool isLoading = false;

  void _processText() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      String name = _textController.text;
      pokemon = await GetPokemonAnswer(name: name).getAnswer();
      validator = 'x';

      setState(() {
        isLoading = false;
      });
    }
  }

  _PokemonFormState();

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Indique el nombre de un Pokémon',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color.secondary)
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(hintText: 'Nombre del Pokémon', border: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese el nombre del pokémon.';
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
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Text(pokemon!.name.toUpperCase()),
                            Image.network(
                              pokemon!.imageUrl,
                              width: 480,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Text('Experiencia base: ${pokemon!.baseExperience}'),
                            Text('Habilidades: ${pokemon!.abilities.join(', ')}'),
                          ],
                        ),
                      )
                    )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}