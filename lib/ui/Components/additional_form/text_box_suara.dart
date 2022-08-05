import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';

class CustomTextBox2 extends StatefulWidget {
  const CustomTextBox2({Key key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<CustomTextBox2> createState() => _CustomTextBox2State();
}

class _CustomTextBox2State extends State<CustomTextBox2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 22, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Text Box 2 :',
            style: TextStyle(fontWeight: Constants.medium),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12,bottom: 12),
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cth. 1000',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Vote',
                  style: TextStyle(fontWeight: Constants.medium),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Addtional Information',
            ),
          ),
        ],
      ),
    );
  }
}
