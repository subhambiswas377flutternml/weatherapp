import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './mydata.dart';
import './mymodel.dart';
import './UI/dashx.dart';
import './UI/dashy.dart';
import './UI/dashz.dart';

class DashBoard extends StatelessWidget {
  int _index;
  DashBoard(this._index);

  Widget build(BuildContext context) {
    MyModel _mv = Provider.of<MyData>(context).myList[_index];
    MediaQueryData _info = MediaQuery.of(context);

    // scaffold
    return Scaffold(
      body: Stack(
        // Background Image
        children: [
          Container(
            height: _info.size.height,
            width: _info.size.width,
            child: FittedBox(
              child: Image(
                image: AssetImage('assets/sun.jpg'),
              ),
              fit: BoxFit.fill,
            ),
          ),

          // Foreground
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: _info.size.height * 0.08,
                  ),

                  // City name
                  Text(
                    _mv.cityName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _info.size.width * 0.17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(
                    height: _info.size.height * 0.02,
                  ),
                  // description
                  Text(
                    _mv.description.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _info.size.width * 0.05,
                    ),
                  ),

                  SizedBox(
                    height: _info.size.height * 0.05,
                  ),

                  // Temprature
                  Text(
                    (_mv.temprature - 273.0).toInt().toString() + " °C",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _info.size.width * 0.1,
                    ),
                  ),

                  SizedBox(
                    height: _info.size.height * 0.05,
                  ),

                  // Container 1
                  Container(
                    height: _info.size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: _info.size.width * 0.02,
                    ),
                    child: DashElementX(_mv),
                  ),

                  SizedBox(
                    height: _info.size.height * 0.05,
                  ),

                  // Container 2
                  Container(
                    height: _info.size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: _info.size.width * 0.02,
                    ),
                    child: DashElementY(_mv),
                  ),

                  SizedBox(
                    height: _info.size.height * 0.05,
                  ),

                  // Container 3
                  Container(
                    height: _info.size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: _info.size.width * 0.02,
                    ),
                    child: DashElementZ(_mv),
                  ),

                  SizedBox(
                    height: _info.size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
