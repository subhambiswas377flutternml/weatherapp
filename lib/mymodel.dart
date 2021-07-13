import 'package:flutter/foundation.dart';

class MyModel {
  final cityName;
  final temprature;
  final condition;
  final humidity;
  final feels_like;
  final visiblity;
  final pressure;
  final wind_speed;
  final description;

  MyModel({
    @required this.cityName,
    @required this.temprature,
    @required this.condition,
    @required this.humidity,
    @required this.feels_like,
    @required this.visiblity,
    @required this.pressure,
    @required this.wind_speed,
    @required this.description,
  });
}
