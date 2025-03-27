import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices{
  fetchWeather()async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=37.7203&lon=30.2908&appid=e2d6c2168cc5772b8c64476143db5d8a"),

    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);

      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}