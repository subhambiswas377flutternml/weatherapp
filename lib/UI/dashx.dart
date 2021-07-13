import 'package:flutter/material.dart';
import '../mymodel.dart';

// UI 1
class DashElementX extends StatelessWidget {
  MyModel _mv;
  DashElementX(this._mv);

  String findSymbol(String _status, var constraint) {
    String sm = '';
    switch (_status) {
      case "Thunderstorm":
        sm = "⛈";
        break;

      case "Drizzle":
        sm = "☔";
        break;

      case "Rain":
        sm = "⛈";
        break;

      case "Snow":
        sm = "❄";
        break;

      case "Clear":
        sm = "☀";
        break;

      case "Clouds":
        sm = "🌥";
        break;

      case "Mist":
        sm = "💧";
        break;

      case "Smoke":
        sm = "🏭";
        break;

      case "Haze":
        sm = "🌵";
        break;

      case "Dust":
        sm = "💨";
        break;

      case "Fog":
        sm = "🌫";
        break;

      case "Sand":
        sm = "⌛";
        break;

      case "Squall":
        sm = "🌦";
        break;

      case "Tornado":
        sm = "🌪️";
        break;

      case "Ash":
        sm = "💨";
        break;

      default:
        sm = "🚫";
        break;
    }

    return sm;
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Column 1
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Feels Like",
                    style: TextStyle(
                      color: Color(0xFF1F5EFF),
                      fontWeight: FontWeight.bold,
                      fontSize: constraint.maxWidth * 0.08,
                    ),
                  ),
                  Text(
                    (_mv.feels_like - 273).toInt().toString() + " °C",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: constraint.maxWidth * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Column 2
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Condition",
                    style: TextStyle(
                      color: Color(0xFF1F5EFF),
                      fontWeight: FontWeight.bold,
                      fontSize: constraint.maxWidth * 0.08,
                    ),
                  ),

                  // Icon Here
                  Text(
                    findSymbol(_mv.condition, constraint),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: constraint.maxWidth * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
