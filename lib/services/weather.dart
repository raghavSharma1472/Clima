import 'networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
const apiKey = '87b039eb8b5162a9cf1d8de8d223887e';
const weatherBasicURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> gerCityLocationweather(cityName) async {
    NetworkingHelper networkingHelper = NetworkingHelper('$weatherBasicURL?q=$cityName&&appid=$apiKey&units=metric');
    var httpData = await networkingHelper.getHttpReq();
    return httpData;
  }
  Future<dynamic> getLocationWeather() async {
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    NetworkingHelper networkingHelper = NetworkingHelper('$weatherBasicURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric');
    var httpData = await networkingHelper.getHttpReq();
    return httpData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
