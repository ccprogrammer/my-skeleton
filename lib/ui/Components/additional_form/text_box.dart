import 'package:flutter/material.dart';
import 'package:my_skeleton/constants/constants.dart';

class CustomTextBox extends StatefulWidget {
  const CustomTextBox({Key key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 22, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Text Box :',
            style: TextStyle(fontWeight: Constants.medium),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45)),
            child: Center(
              child: Focus(
                onFocusChange: (focus) {},
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Input Text . . .',
                    hintStyle: TextStyle(
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
