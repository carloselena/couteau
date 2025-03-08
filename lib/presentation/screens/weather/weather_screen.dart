import 'package:couteau/config/helpers/weather_api/get_weather_answer.dart';
import 'package:couteau/infrastructure/models/weather/weather_model.dart';
import 'package:couteau/presentation/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {

  static const String name = 'weather_screen';
  static const String uri = '/weather_screen';

  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima en RD'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Clima en Santo Domingo, RD',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: color.secondary,
              ),
            ),
            Text(
              '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
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
                
              ),
            ),
            SizedBox(height: 20),
            
            Expanded(
              child: FutureBuilder<WeatherModel>(
                future: GetWeatherAnswer().getAnswer(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(strokeWidth: 2,),
                    ); // Indicador de carga
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error al cargar el clima"));
                  }

                  WeatherModel weather = snapshot.data!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.sunny),
                      Text('Temperatura: ${weather.temp.toString()} °C', style: TextStyle(fontSize: 20, color: color.tertiary)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.ac_unit),
                      Text('Sensación: ${weather.feelsLike.toString()} °C', style: TextStyle(fontSize: 20, color: color.tertiary)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.water_drop),
                      Text('Humedad: ${weather.humidity.toString()}%', style: TextStyle(fontSize: 20, color: color.tertiary)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.wind_power),
                      Text('Viento: ${weather.wind.toString()} km/h', style: TextStyle(fontSize: 20, color: color.tertiary)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.description),
                      Text('Descripción: ${weather.description.toUpperCase()}', style: TextStyle(fontSize: 20, color: color.tertiary)),
                    ],
                  ),
                  // Text(''),
                  // Text(''),
                  // Text(''),
                ],
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
