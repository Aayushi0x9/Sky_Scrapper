import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/screen/controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherController>().loadWether('Surat');
  }

  @override
  Widget build(BuildContext context) {
    double celsius = 273.15;
    WeatherController weatherW =
        Provider.of<WeatherController>(context, listen: false);
    WeatherController weatherR =
        Provider.of<WeatherController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                '${weatherW.weather?.name}',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                '${weatherW.weather!.main!.temp} ℃',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Divider(),
              Text(
                textAlign: TextAlign.center,
                '${weatherW.weather?.weather?[0].main}',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
