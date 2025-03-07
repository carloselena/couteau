import 'package:couteau/config/helpers/gender_api/get_gender_answer.dart';
import 'package:flutter/material.dart';

class GenderForm extends StatefulWidget {

  const GenderForm({
    super.key,
  });
  

  @override
  State<GenderForm> createState() => _GenderFormState();
}

class _GenderFormState extends State<GenderForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  String response = '';
  bool isLoading = false;

  void _processText() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        response = '';
      });

      String name = _textController.text;
      response = await GetGenderAnswer(name: name).getAnswer();

      setState(() {
        isLoading = false;
        response = (response == 'male')
          ? 'assets/gender/gender_reveal_male.gif'
          : 'assets/gender/gender_reveal_female.gif';
      });
    }
  }

  _GenderFormState();

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
                  if (response.isNotEmpty) ...[
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          response,
                          width: 480,
                          height: 200,
                          fit: BoxFit.cover,
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