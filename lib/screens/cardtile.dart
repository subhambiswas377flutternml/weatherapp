import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mydata.dart';
import '../mymodel.dart';
import '../dashboard.dart';

class CardTile extends StatelessWidget {
  int _index;

  CardTile(this._index);

  Widget build(BuildContext context) {
    MediaQueryData _info = MediaQuery.of(context);
    return GestureDetector(
        child: Container(
          height: _info.size.height * 0.2,
          width: double.infinity,
          margin: EdgeInsets.only(
            left: _info.size.width * 0.028,
            right: _info.size.width * 0.028,
            bottom: _info.size.height * 0.028,
          ),
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TileElement(_index),
        ),
        onLongPress: () {},
        onDoubleTap: () {},
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DashBoard(
                _index,
              );
            }),
          );
        });
  }
}

class TileElement extends StatelessWidget {
  int _ind;

  TileElement(this._ind);

  Widget build(BuildContext context) {
    MyModel _vx = Provider.of<MyData>(context).myList[_ind];

    String _city = _vx.cityName;
    double _t = _vx.temprature - 273.0;
    int _temp = _t.toInt();

    return LayoutBuilder(
      builder: (context, constraint) {
        return Row(
          children: [
            SizedBox(
              width: constraint.maxWidth * 0.04,
            ),

            // City Name
            Container(
              width: constraint.maxWidth * 0.35,
              child: Text(
                _city,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: constraint.maxWidth / (_city.length + 5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              width: constraint.maxWidth * 0.22,
              child: (_ind == 0)
                  ? Icon(
                      Icons.place_outlined,
                      color: Colors.white,
                      size: constraint.maxWidth * 0.12,
                    )
                  : null,
            ),

            // Temprature
            Container(
              width: constraint.maxWidth * 0.35,
              child: Center(
                child: Text(
                  _temp.toString() + " °C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraint.maxWidth * 0.1,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: constraint.maxWidth * 0.04,
            ),
          ],
        );
      },
    );
  }
}
