import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitchBox extends StatefulWidget {
  const CustomSwitchBox({Key key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<CustomSwitchBox> createState() => _CustomSwitchBoxState();
}

class _CustomSwitchBoxState extends State<CustomSwitchBox> {
  bool _selectedValue = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.fromLTRB(24, 12, 24, 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Switch Box :',
         
            ),
          ),
          CupertinoSwitch(
            value: _selectedValue,
            activeColor: Colors.blueAccent,
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
