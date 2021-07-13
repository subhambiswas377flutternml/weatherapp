import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cardtile.dart';
import '../mydata.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import './editor.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    Function _rl = Provider.of<MyData>(context).reLocate;
    Function _remove = Provider.of<MyData>(context).removeCity;

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "WeatherX",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white12,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          //background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF462A9F),
                    Color(0xFFFFA02F),
                  ]),
            ),
          ),

          // foreground
          FutureBuilder(
            future: Provider.of<MyData>(context, listen: false).fetch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.pinkAccent,
                ));
              } else {
                return Consumer<MyData>(
                  builder: (context, _mydata, ch) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CardTile(index);
                          } else {
                            return Dismissible(
                              key: Key(_mydata.items[index].cityName),
                              child: CardTile(index),
                              onDismissed: (direction) {
                                _mydata.items.removeAt(index);
                                _remove(index);
                              },
                            );
                          }
                        },
                        itemCount: _mydata.items.length,
                        shrinkWrap: true,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.construction_outlined,
        activeIcon: Icons.close,
        animatedIconTheme: IconThemeData(size: 20),
        backgroundColor: Colors.pinkAccent,
        visible: true,
        curve: Curves.bounceIn,
        foregroundColor: Colors.white,
        children: [
          // add button
          SpeedDialChild(
            labelBackgroundColor: Colors.black,
            child: Icon(Icons.add),
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            onTap: () {
              //_ac("Paris");
              popUpEdit(context);
            },
            label: "Add City",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),

          // location button
          SpeedDialChild(
              child: Icon(Icons.my_location_outlined),
              backgroundColor: Colors.white,
              elevation: 5,
              foregroundColor: Colors.blue,
              labelBackgroundColor: Colors.black,
              label: "Location",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              onTap: () {
                _rl();
              }),
        ],
      ),
    );
  }
}
