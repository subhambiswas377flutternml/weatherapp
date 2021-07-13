import 'package:flutter/material.dart';
import '../mydata.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

final TextEditingController _cityNameDx = TextEditingController();
void popUpEdit(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Container(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.04,
                    horizontal: MediaQuery.of(context).size.width * 0.028,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Editor(),
                ),
              ),
            ),
          ),
        );
      });
}

class Editor extends StatelessWidget {
  Widget build(BuildContext context) {
    Function _ac = Provider.of<MyData>(context).addCity;

    // LayoutBuilder
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: constraint.maxWidth * 0.028,
            ),
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "City Name",
                counterStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: constraint.maxWidth * 0.04),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(),
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              maxLength: 12,
              maxLengthEnforced: true,
              controller: _cityNameDx,
            ),
          ),
          // add button
          Container(
            width: constraint.maxWidth * 0.7,
            height: constraint.maxHeight * 0.15,
            child: RaisedButton(
                color: Colors.black,
                child: Text(
                  "ADD",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: constraint.maxWidth * 0.05,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  String _v = _cityNameDx.text;
                  _v = _v.trim();
                  if (_v == '') {
                    //pass
                  } else {
                    _ac(_v);
                  }
                  _cityNameDx.value = TextEditingValue.empty;
                  Navigator.pop(context);
                }),
          ),
        ],
      );
    });
  }
}
