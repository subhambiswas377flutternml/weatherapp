import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:async/async.dart';
import './mymodel.dart';

class MyData extends ChangeNotifier {
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  List<MyModel> myList = [];

  /*
  cityName: data['name'],
          temprature: data['main']['temp'],
          condition: data['weather'][0]['main'],
          humidity: data['main']['humidity'],
          feels_like: data['main']['feels_like'],
          pressure: data['main']['pressure'],
          visiblity: data['visibility'],
          wind_speed: data['wind']['speed'],
          description: data['weather'][0]['description'],
        );

  */

  List get items {
    return [...myList];
  }

  Future<void> fetch() async {
    return this._memoizer.runOnce(() async {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double _lat = position.latitude;
      double _lon = position.longitude;

      http.Response response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?lat=$_lat&lon=$_lon&appid=3df4f27927a66152a1b3b8be15093de7'),
      );

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body);

        MyModel _mv = MyModel(
          cityName: data['name'],
          temprature: data['main']['temp'],
          condition: data['weather'][0]['main'],
          humidity: data['main']['humidity'],
          feels_like: data['main']['feels_like'],
          pressure: data['main']['pressure'],
          visiblity: data['visibility'],
          wind_speed: data['wind']['speed'],
          description: data['weather'][0]['description'],
        );

        myList.add(_mv);
      }
    });
  }

  // for relocating
  void reLocate() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double _lat = position.latitude;
    double _lon = position.longitude;

    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$_lat&lon=$_lon&appid=3df4f27927a66152a1b3b8be15093de7'),
    );

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      myList[0] = MyModel(
        cityName: data['name'],
        temprature: data['main']['temp'],
        condition: data['weather'][0]['main'],
        humidity: data['main']['humidity'],
        feels_like: data['main']['feels_like'],
        pressure: data['main']['pressure'],
        visiblity: data['visibility'],
        wind_speed: data['wind']['speed'],
        description: data['weather'][0]['description'],
      );
      notifyListeners();
    }
  }

  // for adding new city
  void addCity(String _cityName) async {
    http.Response _res = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=3df4f27927a66152a1b3b8be15093de7'));

    if (_res.statusCode == 200) {
      var _data = convert.jsonDecode(_res.body);

      myList.add(
        MyModel(
          cityName: _data['name'],
          temprature: _data['main']['temp'],
          condition: _data['weather'][0]['main'],
          humidity: _data['main']['humidity'],
          feels_like: _data['main']['feels_like'],
          pressure: _data['main']['pressure'],
          visiblity: _data['visibility'],
          wind_speed: _data['wind']['speed'],
          description: _data['weather'][0]['description'],
        ),
      );
      notifyListeners();
    }
  }

  // for deletion
  void removeCity(int _index) {
    myList.removeAt(_index);
    notifyListeners();
  }
}
