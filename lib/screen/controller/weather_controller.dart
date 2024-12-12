import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/helper/weather_helper.dart';

class WeatherController with ChangeNotifier {
  Helper helper = Helper();
  WeatherModel? weather;
  String cityName = 'Surat';

  Future<void> loadWether([String? cityName]) async {
    weather = await helper.weatherFetch(cityName);
    print('== WetherData ==========$weather');

    notifyListeners();
  }

  // void toCelsius(){
  //
  //   if (weather?.main?.temp != null) {
  //     var tempInCelsius = weather?.main!.temp! - 273.15;
  //   }
  // }
}
