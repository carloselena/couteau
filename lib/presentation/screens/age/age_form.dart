import 'package:couteau/config/helpers/age_api/get_age_answer.dart';
import 'package:couteau/infrastructure/models/age/age_model.dart';
import 'package:flutter/material.dart';

class AgeForm extends StatefulWidget {

  const AgeForm({
    super.key,
  });
  

  @override
  State<AgeForm> createState() => _AgeFormState();
}

class _AgeFormState extends State<AgeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  AgeModel? ageModel;
  String message = '';
  String imageUrl = '';
  bool isLoading = false;

  void _processText() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      String name = _textController.text;
      ageModel = await GetAgeAnswer(name: name).getAnswer();

      setState(() {
        isLoading = false;
        if (ageModel!.age <= 26) {
          message = 'joven';
          imageUrl = 'assets/age/young_people.jpg';
        }
        else if (ageModel!.age <= 59) {
          message = 'adulta';
          imageUrl = 'assets/age/adult_people.jpg';
        }
        else {
          message = 'anciana';
          imageUrl = 'assets/age/elderly_people.jpg';
        }
      });
    }
  }

  _AgeFormState();

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
                    'Indique su nombre',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color.secondary)
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(hintText: 'Nombre', border: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese su nombre.';
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
                  if (imageUrl.isNotEmpty) ...[
                    SizedBox(height: 10,),
                    Column(
                      children: [
                        Text('Edad: ${ageModel!.age}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color.secondary)),
                        Text('Eres una persona $message.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color.secondary)),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              imageUrl,
                              width: 480,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                        ),
                      ],
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