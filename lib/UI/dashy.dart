import 'package:flutter/material.dart';
import '../mymodel.dart';

// UI 2
class DashElementY extends StatelessWidget {
  MyModel _mv;
  DashElementY(this._mv);

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
                    "Humidity",
                    style: TextStyle(
                      color: Color(0xFF1F5EFF),
                      fontWeight: FontWeight.bold,
                      fontSize: constraint.maxWidth * 0.08,
                    ),
                  ),
                  Text(
                    _mv.humidity.toInt().toString() + " %",
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
                    "Visiblity",
                    style: TextStyle(
                      color: Color(0xFF1F5EFF),
                      fontWeight: FontWeight.bold,
                      fontSize: constraint.maxWidth * 0.08,
                    ),
                  ),

                  // Icon Here
                  Text(
                    (_mv.visiblity / 1000).toInt().toString() + " KM",
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
