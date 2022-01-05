import 'dart:math';

import 'package:flutter_cubit_bloc_tutorial/data/weather_api.dart';

import 'model/weather.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<Weather> fetchWeather(int postID);
//   ! Note: yung function definition lang sa repository
}

class FakeWeatherRepository implements WeatherRepository {

  @override
  Future<Weather> fetchWeather(int postID) async {
      final source = await requestPasabayPostByID(postID);
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {

        final random = Random();
        // Simulate some network exception

        if (random.nextBool()) {
          //Basta meron lang dito na TRUE || FALSE
          throw NetworkException();
        }

        // Return "fetched" weather
        return Weather.fromMap(source);
      },
    );
  }
}

class NetworkException implements Exception {}
