// import 'package:couteau/config/helpers/gender_api/get_gender_answer.dart';
// import 'package:couteau/infrastructure/models/gender/gender_model.dart';
import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:couteau/presentation/screens/gender/gender_form.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatelessWidget {

  static const String name = 'gender_screen';
  static const String uri = '/gender_screen';

  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final GenderModel genderModel = GetGenderAnswer().getAnswer();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predictor de Género'),
      ),
      drawer: CustomDrawer(),
      body: GenderForm(),
    );
  }
}