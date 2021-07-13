import 'package:flutter/material.dart';
import '../mymodel.dart';

// UI 3
class DashElementZ extends StatelessWidget {
  MyModel _mv;
  DashElementZ(this._mv);

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
                    "Pressure",
                    style: TextStyle(
                      color: Color(0xFF1F5EFF),
                      fontWeight: FontWeight.bold,
                      fontSize: constraint.maxWidth * 0.08,
                    ),
                  ),
                  Text(
                    _mv.pressure.toString() + " hPa",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: constraint.maxWidth * 0.08,
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
                    "Speed",
                    style: TextStyle(
                      color: Color(0xFF1F5EFF),
                      fontWeight: FontWeight.bold,
                      fontSize: constraint.maxWidth * 0.08,
                    ),
                  ),

                  // Icon Here
                  Text(
                    ((60 * _mv.wind_speed) / 1000).toStringAsFixed(1) + " km/h",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: constraint.maxWidth * 0.08,
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
