import 'package:flutter/material.dart';

class SharedForm extends StatefulWidget {
  final String label;

  const SharedForm({
    super.key,
    required this.label
  });
  

  @override
  State<SharedForm> createState() => _SharedFormState(label: label);
}

class _SharedFormState extends State<SharedForm> {
  final String label;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _SharedFormState({required this.label});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Indique su ${label.toLowerCase()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color.secondary)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: label, border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su ${label.toLowerCase()}.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}